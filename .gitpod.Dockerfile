FROM gitpod/workspace-base

RUN wget micro.mamba.pm/install.sh
RUN bash install.sh