import base64
import glob, os

def write_svg_file(svg_path, encoded_str):
    with open(svg_path, "w") as text_file:
        content = """
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32">
    <image width="32" height="32"
           xlink:href="{0}"
    />
</svg>
"""
        text_file.write(content.format(encoded_str))

def image_to_data_url(filename):
    ext = filename.split('.')[-1]
    prefix = f'data:image/{ext};base64,'
    with open(filename, 'rb') as f:
        img = f.read()
    return prefix + base64.b64encode(img).decode('utf-8')

basePath = "" # set path to icons here

for file in glob.glob(basePath+"/*.png"):
    png_file = file
    svg_file = file[0:-4]+ ".svg"
    image_data = image_to_data_url(png_file)
    write_svg_file(svg_file,image_data)
    os.remove(png_file)