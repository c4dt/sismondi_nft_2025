from PIL import Image
import io
import base64

def create_composite_image(file_paths, output_width):
    # Load the images
    images = [Image.open(fp).convert("RGBA") for fp in file_paths]

    # Superimpose the images one over the other
    composite = Image.alpha_composite(Image.alpha_composite(images[0], images[1]), images[2])

    # Resize the image
    aspect_ratio = composite.height / composite.width
    new_height = int(output_width * aspect_ratio)
    resized_composite = composite.resize((output_width, new_height))

    # Convert the image to base64
    buffered = io.BytesIO()
    resized_composite.save(buffered, format="PNG")
    img_str = base64.b64encode(buffered.getvalue())

    return f"data:image/png;base64,{img_str.decode()}"

# Example usage (replace 'file1.png', 'file2.png', 'file3.png' with actual file paths)
file_paths = ['./images/background/file2.png', './images/shoe/file1.png', './images/sole/file2.png']
composite_image_base64 = create_composite_image(file_paths, 20)
print(composite_image_base64)

