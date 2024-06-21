FROM gitpod/workspace-full

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/gitpod/.cargo/bin:${PATH}"
RUN rustup update stable && rustup default stable

# Install Solana
RUN sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
ENV PATH="/home/gitpod/.local/share/solana/install/active_release/bin:${PATH}"

# Install Anchor
RUN source $HOME/.cargo/env && cargo install --git https://github.com/project-serum/anchor --tag v0.24.2 anchor-cli --locked
