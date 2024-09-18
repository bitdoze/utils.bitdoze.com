#!/bin/bash

# Define the overlay2 directory
overlay_dir="/var/lib/docker/overlay2"

# Create a temporary file to store the results
temp_file=$(mktemp)

# Array to store used subfolders
used_subfolders=()

# Loop through each Docker image ID
for image_id in $(docker image ls -q); do
  # Inspect the image to get detailed information
  image_info=$(docker inspect "$image_id")

  # Get the image name (repository and tag)
  repo_tag=$(docker inspect --format '{{index .RepoTags 0}}' "$image_id")

  # Check all subfolders in the overlay2 directory
  while IFS= read -r -d '' subfolder; do
    if echo "$image_info" | grep -q "$subfolder"; then
      # Get the space used by the subfolder
      space_used=$(du -sh "$subfolder" | cut -f1)

      # Convert space used to bytes for sorting
      space_used_bytes=$(du -sb "$subfolder" | cut -f1)

      # Output the image ID, image name, subfolder, space used, and space used in bytes to the temporary file
      echo "$space_used_bytes $space_used Image ID: $image_id Image Name: $repo_tag Subfolder: $subfolder" >> "$temp_file"

      # Add subfolder to the used_subfolders array
      used_subfolders+=("$subfolder")
    fi
  done < <(find "$overlay_dir" -maxdepth 1 -mindepth 1 -type d -print0)
done

# Loop through all subfolders in the overlay2 directory
while IFS= read -r -d '' subfolder; do
  # Check if the subfolder is not in the used_subfolders array
  if ! [[ " ${used_subfolders[@]} " =~ " $subfolder " ]]; then
    # Get the space used by the subfolder
    space_used=$(du -sh "$subfolder" | cut -f1)

    # Convert space used to bytes for sorting
    space_used_bytes=$(du -sb "$subfolder" | cut -f1)

    # Output the subfolder information to the temporary file
    echo "$space_used_bytes $space_used Image ID: N/A Image Name: N/A Subfolder: $subfolder" >> "$temp_file"
  fi
done < <(find "$overlay_dir" -maxdepth 1 -mindepth 1 -type d -print0)

# Sort the results by space used in bytes (from largest to smallest) and display them
sort -nr "$temp_file" | cut -d' ' -f2- | column -t

# Remove the temporary file
rm "$temp_file"
