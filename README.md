# SnapBoy
javascript/esp8266 Game Boy Printer server hackathon entry for Hack OHI/O

Doc: https://docs.google.com/presentation/d/1FiPQcMDoI7tq2KkoVU-QSdlywwBn-29Nma4zHEfw3RQ/edit?usp=sharing

Front end app uses HTML5 webcam and canvas to take an image
Image is sent to NodeJS server for image processing.
Image is converted to 2-bit color, then passed through a dithering algorithim to add depth
Image is then converted to binary.
ESP polls the server for data rows, then sends the data to the gameboy printer
