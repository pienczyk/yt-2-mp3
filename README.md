# yt-2-mp3

Docker image tools to download the yt videos to the mp3.
Uses: <br>
[Alpine Linux](https://www.alpinelinux.org/) <br>
[ffbinaries](https://ffbinaries.com/downloads) <br>
[yt-dlp](https://github.com/yt-dlp/yt-dlp) <br>

Currently image is build for amd64 and arm64 (*tested on the Raspberry 4)* architectures.

## Running
Image supports all of the [yt-dlp](https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#usage-and-options) options.


**Example:**  <br>
Download YT-VIDEO-LINK to the working directory:
```
docker container run --volume $(pwd):/download pienczyk/yt-2-mp3:latest \
--extract-audio --audio-format mp3 \
--audio-quality 0 \
"YT-VIDEO-LINK"

```
