.. _ch-intro:

************
Introduction
************

Installation
============

Install the required Python packages::

    pip install -r requirements.txt

Building
========

You need ``make``. The following targets are supported:

html
  Builds HTML format, separated into sections
singlehtml
  Builds HTML format on a single page
text
  Builds text files, separated into sections
singletext
  Builds a single text file
latexpdf
  Builds into latex source files and then compiles into a PDF. Requires latex.

Changes
=======

The following changes and additions have been made from vanilla Sphinx:

* A cross-format bibtex bibliography based on sphinx-natbib
* Tables that can go inside figures
* Changed table formatting to look pretty, like booktabs
* Improved alignment in table environment
* Added support for short captions that show up in the "list of figures" section
* Changed equation reference formatting from "(1)" to "1"
* Full customization of latex preamble and style file
* Numbered figures
* Numbered section references
* A singletext output that builds into a single text file, similar to singlehtml
* A subfigure environment

Documents Using sphinxtr
========================

* `Jeff Terrace's PhD Thesis <http://www.cs.princeton.edu/~jterrace/thesis/>`_
