[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/edisnord/jupyter-octave-with-lsp.git/master?urlpath=lab/)

# Jupyter lab with an Octave kernel

![Octave in Jupyter](octave.png)

Instructions are the same as the [Minimal Jupyter Notebook Stack](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook) for running this image (on which this is based).

Uses the [mlang](https://github.com/TomiVidal99/mlang) language server and jupyterlab-lsp
for lsp support.

Use `docker.io/rubenv/jupyter-octave` as the image name.

## Known issues

If you're getting black plots, add the following: `%plot --format svg`.
