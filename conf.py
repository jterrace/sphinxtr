import sys, os

# directory relative to this conf file
CURDIR = os.path.abspath(os.path.dirname(__file__))
# add custom extensions directory to python path
sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), 'extensions'))

# import the custom html and latex builders/translators/writers
import html_mods
import latex_mods

# If your documentation needs a minimal Sphinx version, state it here.
#needs_sphinx = '1.0'

# import order is important here
extensions = [
              'fix_equation_ref',
              'sphinx.ext.mathjax',
              'sphinx.ext.ifconfig',
              'subfig',
              'numfig',
              'numsec',
              'natbib',
              'figtable',
              'singlehtml_toc',
              'singletext',
              ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['templates']

# The suffix of source filenames.
source_suffix = '.rst'

# The encoding of source files.
source_encoding = 'utf-8-sig'

# General information about the project.
project = u'The Sphinx Thesis Resource (sphinxtr)'
author = u'Jeff Terrace'
copyright = u'by %s, 2012.' % author
version = '0.1'
release = '0.1'

# Turns on numbered figures for HTML output
number_figures = True

# configures bibliography
# see http://wnielson.bitbucket.org/projects/sphinx-natbib/
natbib = {
    'file': 'refs.bib',
    'brackets': '[]',
    'separator': ',',
    'style': 'numbers',
    'sort': True,
}

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
exclude_patterns = [
                    '_build',
                    'tex',
                    'epilog.rst',
                    'README.rst',
                    ]

# The master toctree document.
# Ideally, we wouldn't have to do this, but sphinx seems to have trouble with
# directives inside only directives
if tags.has('latex'):
    master_doc = 'index_tex'
    exclude_patterns.append('index.rst')
else:
    master_doc = 'index'
    exclude_patterns.append('index_tex.rst')

# A string of reStructuredText that will be included at the end of
# every source file that is read.
rst_epilog = open(os.path.join(CURDIR, 'epilog.rst'), 'r').read()

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'


# -- Options for HTML output ---------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
html_theme = 'sphinxdoc'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#html_theme_options = {}

# Add any paths that contain custom themes here, relative to this directory.
#html_theme_path = []

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "%s" % project

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = "Someone's PhD Thesis"

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
#html_logo = None

# The name of an image file (within the static path) to use as favicon of the
# docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
# pixels large.
#html_favicon = None

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['static']

# If not '', a 'Last updated on:' timestamp is inserted at every page bottom,
# using the given strftime format.
#html_last_updated_fmt = '%b %d, %Y'

# If true, SmartyPants will be used to convert quotes and dashes to
# typographically correct entities.
#html_use_smartypants = True

# Custom sidebar templates, maps document names to template names.
template_files = ['localtoc.html', 'relations.html', 'sourcelink.html']
if not tags.has('singlehtml'):
    # only include search box for regular html, not single page html
    template_files.append('searchbox.html')
html_sidebars = {
   '**': template_files,
}

# Additional templates that should be rendered to pages, maps page names to
# template names.
#html_additional_pages = {}

# If false, no module index is generated.
html_domain_indices = False

# If false, no index is generated.
html_use_index = False

# If true, the index is split into individual pages for each letter.
#html_split_index = False

# If true, links to the reST sources are added to the pages.
#html_show_sourcelink = True

# If true, "Created using Sphinx" is shown in the HTML footer. Default is True.
#html_show_sphinx = True

# If true, "(C) Copyright ..." is shown in the HTML footer. Default is True.
#html_show_copyright = True

# If true, an OpenSearch description file will be output, and all pages will
# contain a <link> tag referring to it.  The value of this option must be the
# base URL from which the finished HTML is served.
#html_use_opensearch = ''

# This is the file name suffix for HTML files (e.g. ".xhtml").
#html_file_suffix = None

# supresses the last dot in section numbers
# changes "1. Introduction" -> "1 Introduction"
# default string is ". "
html_secnumber_suffix = " "

# Output file base name for HTML help builder.
htmlhelp_basename = 'htmlhelpoutput'

# location of mathjax script if you don't want to use CDN
# mathjax_path = 'MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML'




# -- Options for LaTeX output --------------------------------------------------

ADDITIONAL_PREAMBLE = """
\input{preamble._tex}
\usepackage{sphinx}
"""

ADDITIONAL_FOOTER = """
\input{footer._tex}
"""

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    'papersize': 'letterpaper',
    
    # * gets passed to \documentclass
    # * default options are single sided, double spaced
    #   you can change them with these options:
    #   * twoside
    #   * singlespace
    # * you might want to omit the list of tables (lot)
    #   if you use figtable without the :nofig: option
    'classoptions': ',english,lof,lot',
    
    # The font size ('10pt', '11pt' or '12pt').
    'pointsize': '12pt',
    
    # Additional stuff for the LaTeX preamble.
    'preamble': ADDITIONAL_PREAMBLE,
    
    # Additional footer
    'footer': ADDITIONAL_FOOTER,
    
    # disable font inclusion
    'fontpkg': '',
    'fontenc': '',
    
    # disable fancychp
    'fncychap': '',
    
    # get rid of the sphinx wrapper class file
    'wrapperclass': 'puthesis',
    
    # override maketitle
    'maketitle': '\makefrontmatter',
    'tableofcontents': '',
    
    # disable index printing
    'printindex': '',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
    ('index_tex',
     'thesis.tex',
     project,
     author,
     'manual',
     True),
]

latex_docclass = {
    'manual': 'puthesis',
}

latex_additional_files = [
    'tex/puthesis.cls',
    'tex/preamble._tex',
    'tex/footer._tex',
    'tex/sphinx.sty',
    'tex/Makefile',
    'tex/refstyle.bst',
    'refs.bib',
    'tex/ccicons.sty',
]

# The name of an image file (relative to this directory) to place at the top of
# the title page.
#latex_logo = None

# For "manual" documents, if this is true, then toplevel headings are parts,
# not chapters.
latex_use_parts = False

# If true, show page references after internal links.
#latex_show_pagerefs = False

# If true, show URL addresses after external links.
#latex_show_urls = False

# Documents to append as an appendix to all manuals.
#latex_appendices = []

# If false, no module index is generated.
latex_domain_indices = False

