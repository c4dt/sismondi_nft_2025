from PIL import Image
import io
import os
import base64

image_dir = os.path.join(os.path.dirname(__file__), "..", "images")

def create_composite_image(file_paths, output_width):
    # Load the images
    images = [Image.open(os.path.join(image_dir, fp)).convert("RGBA") for fp in file_paths]

    # Superimpose the images one over the other
    composite = Image.alpha_composite(Image.alpha_composite(images[0], images[1]), images[2])

    # Resize the image
    aspect_ratio = composite.height / composite.width
    new_height = int(output_width * aspect_ratio)
    resized_composite = composite.resize((output_width, new_height))

    # Convert the image to base64
    buffered = io.BytesIO()
    resized_composite.save(buffered, format="PNG")
    img_str_base64 = base64.b64encode(buffered.getvalue())

    return f"data:image/png;base64,{img_str_base64.decode()}"


def get_common(images):
    pre = os.path.commonprefix(images)
    remaining_parts = ['"'+s[len(pre):] for s in images]
    return pre+'"', remaining_parts


# Example usage (replace 'file1.png', 'file2.png', 'file3.png' with actual file paths)
backgrounds = [
    "background/file1.png",
    "background/file2.png",
]
shoes = [
    "shoe/file1.png",
    "shoe/file2.png",
]
soles = [
    "sole/file1.png",
    "sole/file2.png",
]

# For-loop with all combinations of backgrounds / shoe / sole
images_long = []
for background in backgrounds:
    for shoe in shoes:
        for sole in soles:
            img_str = create_composite_image([background, shoe, sole], 30)
            images_long.append(f"\"{img_str}\"")


prefix, images_short = get_common(images_long)
print("Prefix is:")
print(prefix)
print("Images are:")
print(",\n".join(images_short))