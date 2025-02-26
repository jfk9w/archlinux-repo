FROM archlinux:base-devel

# Install Git
RUN pacman -Syu --noconfirm --noprogressbar git

# Create non-root user
RUN useradd -m -G wheel -s /bin/bash paru
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install paru
USER paru
RUN git clone https://aur.archlinux.org/paru-bin.git /tmp/paru
RUN cd /tmp/paru && makepkg -si --noconfirm

# Set up build directory
USER root
RUN mkdir /build
WORKDIR /build

CMD chown paru:paru -R . && sudo -u paru paru --noconfirm -B . && chown root:root -R .
