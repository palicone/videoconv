@ECHO OFF
SET INPUT=%1
SET OUTPUT=%~dpn1_480.mp4

  :: 16MB/min is OK
  
  :: -vf "transpose=1,scale=480:854": Rotate 90 clockwise, scale to 480x854 (portrait 480p)
  :: -c:v libx264: H.264 video codec
  :: -profile:v main -level 4.0: Max browser compatibility
  :: -pix_fmt yuv420p: Required for web
  :: -c:a aac -b:a 96k: Web-compatible audio
  :: -movflags +faststart: Enables quick streaming
  :: -vsync cfr -r 30: Constant frame rate, 30 fps
  :: -metadata:s:v rotate=0: Removes rotation flag
  :: -b:v 2200k

SET SIZE_FLAGS=-vf "scale=480:854"
rem SET SIZE_FLAGS=-vf "transpose=1,scale=480:854"

ffmpeg -i %INPUT% ^
%SIZE_FLAGS% ^
-c:v libx264 -profile:v main -level 4.0 ^
-crf 28 -preset slow ^
-pix_fmt yuv420p ^
-c:a aac -b:a 96k ^
-movflags +faststart ^
-vsync cfr -r 23.976 ^
-metadata:s:v rotate=0 ^
%OUTPUT%
