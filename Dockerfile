FROM quay.io/jupyter/base-notebook

USER root

RUN apt-get update && \
    apt-get install -y octave wget octave-statistics \
        octave-symbolic octave-miscellaneous \
        gnuplot gnuplot-qt ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER $NB_UID

RUN echo "graphics_toolkit (\"gnuplot\")" >> '/home/jovyan/.octaverc'

RUN conda install --quiet --yes \
    'jupyterlab-lsp' 'octave_kernel' 'conda-forge::nodejs' && \
    conda clean -tipcl && \
    fix-permissions $CONDA_DIR

RUN jupyter labextension enable jupyterlab-lsp

RUN wget https://github.com/TomiVidal99/mlang/releases/download/v2.1.0/server.js
RUN chmod +x server.js
RUN printf '#!%s\n%s\n' "$(which node)" "$(cat server.js)" > ~/octave-lsp
RUN rm server.js
RUN chmod +x ~/octave-lsp

COPY mlang.json /etc/jupyter/jupyter_server_config.d/
