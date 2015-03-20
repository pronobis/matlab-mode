This is an unofficial port of the MATLAB and Emacs integration mode from the project CVS repo  (http://sourceforge.net/projects/matlab-emacs/) to GitHub (as of March 2015). The following changes were added on top of the original project:

1. New company-matlab.el backend that works both inside the Matlab shell and in Matlab files
2. New flycheck-mlint back-end for flycheck which uses mlint to highlight warnings in Matlab files.
3. Fixed additional newlines and incorrect formatting of prompt after completion
4. Fixed version parsing for new Matlab versions
5. Re-enabled HTML parsing

# Installation

Add the following to your .emacs file:

```
;; Replace path below to be where your matlab.el file is.
(add-to-list 'load-path "~/path/to/matlab-emacs")
(load-library "matlab-load")

;; Enable CEDET feature support for MATLAB code. (Optional)
;; (matlab-cedet-setup)
```

To use the company completion engine, add company-matlab to company-mode backends list:

```
(add-to-list 'company-backends 'company-anaconda)
```

**NOTE!** In order for the completions to work Matlab shell must be started!

To use the flycheck mlint backedn, add the following to your init file:

```
(eval-after-load 'flycheck
  '(require 'flycheck-matlab-mlint))
```

**NOTE!** Matlab binary folder, e.g. `/opt/MATLAB/R2013a/bin` must be in your path for this to work.


# Original Project Documentation

## Finding Updates

### Releases

   The most recent version of matlab.el is always in CVS.

   You can get an old downloader for matlab-emacs from MATLAB File Exchange.

   Category:
   http://www.mathworks.com/matlabcentral/fileexchange/loadCategory.do?objectId=19&objectType=Category
   This File
   http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=104&objectType=file

   Older versions of matlab.el can be found as matlab.el.1.10.1
   for emacsen that do not have the latest additional utilities such
   as tempo and derived.

   matlab.el and mlint.el has shipped on MATLAB CDs starting with 6.5
   (R13).  Updates after a release of MATLAB will be made to MATLAB
   Central and announced on the mailing list.

   matlab.el and mlint.el will no longer ship on MATLAB CDs starting
   with MATLAB release R2008b.  If you are using a version of MATLAB
   from before R2008a, you will want to use the version of mlint from
   that CD.

### CVS

   matlab-emacs is available via CVS from SourceForge.

   Homepage:
   http://matlab-emacs.sf.net

   Project Page:
   http://sourceforge.net/projects/matlab-emacs

   CVS Repository:
   http://matlab-emacs.cvs.sourceforge.net/matlab-emacs

   If you do not have a CVS client on your machine, you can use the
   MATLAB script dl_emacs_support.m to download a fresh copy of the
   matlab.el sources.

   http://matlab-emacs.cvs.sourceforge.net/viewvc/matlab-emacs/matlab-emacs/dl_emacs_support.m

### Dependancies

   MATLAB-Emacs can use the CEDET suite for the following items:
	- Modifying the build system (Makefiles, etc)
	- mlint (uses EIEIO object system)
	- parsing/completion (uses semantic parsing system)
        - some template insertion features

   As of Emacs 23.2, CEDET is included in Emacs, and nothing extra
   is needed to satisfy that dependency.

   For older versions of Emacs:

   See http://cedet.sf.net for downloading CEDET.

   If you only want to use matlab.el for editing code or running the
   MATLAB shell, you DO NOT need to install CEDET.

   If you do want to use CEDET, add the following to your .emacs file:

   (matlab-cedet-setup)

## Mailing List:

### New Mailing List

   A new matlab-emacs-discuss mailing lisit has been created at
   SourceForge.  Use this list to get updates on new releases and
   discuss topics relivant to the matlab-emacs project.

   http://lists.sourceforge.net/mailman/listinfo/matlab-emacs-discuss

### Old Mailing List

   The original mailing list where beta versions of matlab.el were
   posted, and where comments, questions, bug reports, and answers to
   questions could be sent.  If you were subscribed to this list,
   please unsubscribe, and subscribe to the new list above.

   to unsubscribe, send email with the body of: "unsubscribe matlab-emacs"
