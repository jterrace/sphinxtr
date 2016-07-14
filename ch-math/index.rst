.. _ch-math:

****
Math
****

Math uses latex math syntax:

.. math::

    A^{''}_c =
    \sqrt[3]{
    \left(\frac{L^2_c}{\sum{L^2}}\right)
    \left(\frac{A_c}{\sum{A}}\right)
    \left(\frac{A'_c}{\sum{A'}}\right)
    } \cdot T

Equations can have labels which you can reference |nbsp| :eq:`eq-cc-err-stop`.

.. math:: \frac{log(1 + E_{current})}{log(1 + E_{max})}
    :label: eq-cc-err-stop

You can also have inline math, so if you wanted to tell someone that the
function :math:`x^2` only has one place where :math:`y=0`, you could tell them
it was at :math:`x=0`.
