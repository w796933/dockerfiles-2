## base-desktop

[![Docker Repository on Quay.io](https://quay.io/repository/oszi/base-desktop/status "Docker Repository on Quay.io")](https://quay.io/repository/oszi/base-desktop)

A common base image for **desktop** images based on **Fedora**.

Any user's home directory will be overridden to `/data` inside a container
which then must be writable by an arbitrary user on the host.
This is not a multi-user environment so let it be world writable,
allowing us to drop all linux capabilities, including SETUID and CHOWN.
All of this is necessary so every container can have it's own skeleton
home directory in an easily disposable volume without an entrypoint script
and dangerous linux capabilities.

Recent RPM Fusion installers are available in `/usr/share/rpmfusion`.

## Usage

Docker run options:

To match the host user/group IDs:

 * `-u $UID:$GID`

To share important configuration files (read-only):

 * `-v /etc/passwd:/etc/passwd:ro`

 * `-v /etc/group:/etc/group:ro`

 * `-v /etc/machine-id:/etc/machine-id:ro`

 * `-v /etc/localtime:/etc/localtime:ro`

For local audio and graphics:

 * `-v /run/user/$UID/pulse:/run/user/$UID/pulse:ro`

 * `-v /tmp/.X11-unix:/tmp/.X11-unix:ro`

	 * `-e DISPLAY="unix${DISPLAY}"`

To allow direct access to graphics and audio devices:

 * `--device=/dev/dri:/dev/dri:rw`

 * `--device=/dev/snd:/dev/snd:rw`

To drop all linux capabilities:

 * `--cap-drop=ALL`

Finally, mount the necessary directories in `/data` for the application.

## Host requirements

 * Docker 1.7+

 * X11/XWayland

 * Pulseaudio

Best compatible with Fedora based systems.
