#!/bin/bash

sed -e $'s:\hypertarget{refs}{}:\hypertarget{refs}{} \\\\noindent \\\\vspace{-2em} \\\\setlength{\\\\parindent}{-0.5in} \\\\setlength{\\\\leftskip}{0.5in} \\\\setlength{\\\\parskip}{15pt}\\\n\\\n:' | sed -e $'s:\hypertarget{bibliography}:\\clearpage\\\n\\\\hypertarget{bibliography}:'
