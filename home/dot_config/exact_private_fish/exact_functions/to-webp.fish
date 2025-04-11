function to-webp -a input_file -a quality -a output_file
    magick convert $input_file -define webp:near-lossless=$quality $output_file
end
