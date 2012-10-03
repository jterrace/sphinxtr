.. _ch-figs:

******************
Figures and Tables
******************

Vector SVG Figures
==================

Vector figures are nicely supported. You should have a PDF file and an SVG
file. The PDF will be used for the latex output and the SVG for the HTML
output. The HTML output has a nice zoom feature using Colorbox.

.. _fig-sirikata-overview:

.. figure:: fig/overview.*
    :alt: Sirikata System Overview
    :width: 60%
    :align: center
    
    The Sirikata metaverse platform architecture.

See an example in Figure |nbsp| :num:`fig-sirikata-overview`. I suggest making
figures in something like Inkscape. If you have only a vector PDF, you can use
pdf2svg to convert (``brew install pdf2svg`` or ``apt-get install pdf2svg``).

Image Figures
=============

Regular rasterized images work fine too.

.. _fig-open3dhub-icons:

.. figure:: fig/icons.png
    :alt: Open3DHub Browsing Interface
    :width: 86.05%
    :align: center
    
    The Open3DHub website allows browsing of 3D meshes.

A PNG example is shown in Figure |nbsp| :num:`fig-open3dhub-icons`.

Subfigures
==========

The subfigure directives allow you to place multiple figures side-by-side in
the document. Here's an example:

.. subfigstart::

.. _fig-cc-teddy-base:

.. figure:: fig/teddy_0_128.png
    :alt: Base Mesh + 128x128 Texture (334 KB)
    :width: 90%
    :align: center
    
    Base Mesh + 128x128 Texture (334 KB)


.. _fig-cc-teddy-25:

.. figure:: fig/teddy_25_256.png
    :alt: Base Mesh + 25% Stream + 256x256 Texture (568 KB)
    :width: 90%
    :align: center
    
    Base Mesh + 25% Stream + 256x256 Texture (568 KB)


.. _fig-cc-teddy-50:

.. figure:: fig/teddy_50_512.png
    :alt: Base Mesh + 50% Stream + 512x512 Texture (923 KB)
    :width: 90%
    :align: center
    
    Base Mesh + 50% Stream + 512x512 Texture (923 KB)


.. _fig-cc-teddy-75:

.. figure:: fig/teddy_75_1024.png
    :alt: Base Mesh + 75% Stream + 1024x1024 Texture (1755 KB)
    :width: 90%
    :align: center
    
    Base Mesh + 75% Stream + 1024x1024 Texture (1755 KB)

.. _fig-cc-teddy-100:

.. figure:: fig/teddy_100_2048.png
    :alt: Base Mesh + 100% Stream + 2048x2048 Texture (4385 KB)
    :width: 90%
    :align: center
    
    Base Mesh + 100% Stream + 2048x2048 Texture (4385 KB)


.. _fig-cc-teddy-original:

.. figure:: fig/teddy_orig.png
    :alt: Original Mesh (913 KB)
    :width: 90%
    :align: center
    
    Original Mesh (913 KB)

.. subfigend::
    :width: 0.30
    :alt: Example Model Resolutions
    :label: fig-cc-teddy
    
    Example of a teddy bear model at different resolutions of the
    progressive format (1 draw call) and its original format (16 draw
    calls). The size in KB assumes downloading progressively, |eg|
    :num:`fig-cc-teddy-100`'s size includes lower-resolution textures.

You can reference the entire Figure |nbsp| :num:`fig-cc-teddy` or one of its
subfigures, |eg| Figure |nbsp| :num:`fig-cc-teddy-original`.

Table
=====

Tables can be put inside the figtable directive which automatically numbers
them, adds a caption, and adds a label.

.. figtable::
    :label: table-cc-file-size
    :caption: Mean size of progressive format as a fraction of the
              original across all test models, shown as a function of the
              progressive stream downloaded and texture resolution.
    :alt: Mean Size of Progressive Format
    :spec: r r r r r r r

    ===========  ====  ====  ====  ====  ====
    Progressive  128   256   512   1024  2048
    ===========  ====  ====  ====  ====  ====
             0%  0.53  0.63  0.81  1.03  1.35
            25%  0.65  0.75  0.97  1.16  1.45
            50%  0.74  0.85  1.02  1.26  1.58
            75%  0.79  0.95  1.11  1.34  1.70
           100%  0.88  0.99  1.20  1.44  1.82
    ===========  ====  ====  ====  ====  ====

Table |nbsp| :num:`table-cc-file-size` has all right-aligned columns.

.. figtable::
    :label: table-mixed-align
    :caption: This table has mixed alignment
    :alt: Mixed Alignment Table
    :spec: l r

    =======================  =========================
    Left Align               Right Align
    =======================  =========================
    Some text is left align  Followed by right-aligned
    Some more text here      And more text here
    And even more text       Also even more text here
    =======================  =========================

Table |nbsp| :num:`table-mixed-align` has one column left-aligned and one
column right-aligned.

Text Wrapping Table
===================

Text wrapping in tables work if you specify the width and either raggedleft or
raggedright.

.. figtable::
    :label: fig-open3dhub-cfs
    :caption: A list of Open3DHub's Cassandra column families and their descriptions
    :alt: Open3DHub Cassandra Column Families
    :spec: >{\raggedleft\arraybackslash}p{0.25\linewidth} p{0.65\linewidth}

    ============================== ==============================================================================================================================
    Column Family                  Description
    ============================== ==============================================================================================================================
    **Users**                      Stores a list of users who have authenticated with OpenID.
    **Names**                      Stores a list of the 3D models in the database with their associated metadata.
    **TempFiles**                  Temporarily stores the binary file data of uploaded files until they have been processed.
    **Files**                      Stores the binary file data for uploaded and verified files.
    **Sessions**                   Stores HTTP session information used by the Django framework to look up session state associated with a user's browser cookie.
    **OpenIdAssocs, OpenIdNonces** Stores OpenID authentication information for users.
    **CeleryResults**              Stores the result of application processing tasks (see Section something).
    **APIConsumers**               Stores a list of consumers of the API for use with the OAuth protocol.
    ============================== ==============================================================================================================================

A text wrapping table example is shown in Figure |nbsp| :num:`fig-open3dhub-cfs`.
