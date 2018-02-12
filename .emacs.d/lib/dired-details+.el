<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: dired-details+.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="https://www.emacswiki.org/emacs?action=edit;id=dired-details%2b.el" /><link type="text/css" rel="stylesheet" href="https://www.emacswiki.org/light.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="https://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: dired-details+.el" href="https://www.emacswiki.org/emacs?action=rss;rcidonly=dired-details%2b.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="https://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="https://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="https://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for dired-details+.el only"
      href="https://www.emacswiki.org/emacs?action=rss;rcidonly=dired-details%2b.el" /><meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('✎')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="default"><div class="header"><a class="logo" href="https://www.emacswiki.org/emacs/SiteMap"><img alt="[Home]" class="logo" src="https://www.emacswiki.org/images/logo218x38.png" /></a><div class="menu"><span class="gotobar bar"><a class="local" href="https://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="https://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="https://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="https://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="https://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="https://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="https://www.emacswiki.org/emacs/News">News</a> <a class="local" href="https://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="https://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><form method="get" action="https://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a href="https://www.emacswiki.org/emacs?search=%22dired-details%2b%5c.el%22" rel="nofollow" title="Click to search for references to this page">dired-details+.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="https://www.emacswiki.org/emacs/download/dired-details%2b.el">Download</a> <a href="https://github.com/emacsmirror/emacswiki.org/blob/master/dired-details%2b.el">Git</a> <a href="https://www.emacswiki.org/emacs/download/dired-details%2b.el">Homepage</a></p><pre>;;; dired-details+.el --- Enhancements to library `dired-details+.el'.
;;
;; Filename: dired-details+.el
;; Description: Enhancements to library `dired-details+.el'.
;; Author: Drew Adams
;; Maintainer: Drew Adams (concat "drew.adams" "@" "oracle" ".com")
;; Copyright (C) 2005-2018, Drew Adams, all rights reserved.
;; Created: Tue Dec 20 13:33:01 2005
;; Version: 0
;; Package-Requires: ((dired-details "0"))
;; Last-Updated: Mon Jan  1 10:52:44 2018 (-0800)
;;           By: dradams
;;     Update #: 238
;; URL: https://www.emacswiki.org/emacs/download/dired-details%2b.el
;; Doc URL: https://www.emacswiki.org/emacs/DiredDetails
;; Keywords: dired, frames
;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x, 25.x, 26.x
;;
;; Features that might be required by this library:
;;
;;   `autofit-frame', `dired', `dired-details', `fit-frame',
;;   `misc-fns', `strings', `thingatpt', `thingatpt+'.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  This enhances the functionality of library `dired-details.el'.
;;
;;
;;    NOTE: If you use Emacs 24.4 or later, and if you use library
;;          `dired+.el', THEN YOU DO NOT NEED THIS library or library
;;          `dired-details.el'.
;;
;;          Instead, you can use `dired-hide-details-mode'.  Library
;;          `dired+.el' enhances `dired-hide-details-mode' to give it
;;          the same features as `dired-details+.el' provides.  In
;;          that case, use `(require 'dired+.el)', and use option
;;          `diredp-hide-details-propagate-flag' instead of option
;;          `dired-details-propagate-flag'.
;;
;;
;;  `dired-details+.el' enhances `dired-details.el' in these ways:
;;
;;  1. It shrink-wraps Dired's frame whenever you show or hide
;;     details.  For this enhancement, you will need library
;;     `autofit-frame.el'.
;;
;;  2. It updates the listing whenever you create new files or
;;     directories or rename them.
;;
;;  3. It adds user option `dired-details-propagate-flag' which, if
;;     non-nil, propagates the last state you chose to the next Dired
;;     buffer you open.
;;
;;  4. It binds both `)' and `(' to `dired-details-toggle'.
;;
;;  Perhaps #2 corresponds to this TO-DO item in `dired-details.el':
;;
;;    * add a hook for dired-add-file to hide new entries as necessary
;;
;;
;;  ***** NOTE: The following function defined in `dired-details.el'
;;              has been REDEFINED HERE:
;;
;;  `dired-details-activate' - If `dired-details-propagate-flag' is
;;                             non-nil, then use the last state.
;;
;;
;;  Put this in your initialization file (~/.emacs):
;;
;;   (require 'dired-details+)
;;
;;  I also recommend customizing `dired-details-hidden-string' to use
;;  the value "" instead of the default "[...]" - less wasted space.
;;
;;  Note: This library also calls `dired-details-install', activates
;;  show/hide and binds key `)'.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;; 2013/07/22 dadams
;;     Hard-require, not soft-require, dired-details.el.
;; 2013/07/19 dadams
;;     Mention in Commentary that you do not need dired-details(+).el for Emacs
;;       24.4 or later.
;; 2013/07/13 dadams
;;     If dired-hide-details-mode is defined, bind that to (, like vanilla Emacs.
;; 2011/01/04 dadams
;;     Added autoload cookies for defcustom.
;; 2009/06/07 dadams
;;     eval-after-load dired-details, and require dired.  Thx to Suvayu Ali.
;;     dired-details-propagate-flag: Added :group's.  Thx to Thierry Volpiatto.
;; 2008/03/28 dadams
;;     Do everything while widened.
;; 2008/03/08 dadams
;;     dired-details-activate: Save restriction.
;; 2008/03/04 dadams
;;     dired-details-activate:
;;       Widen, then delete overlays initially, to trim new lines from, e.g. `C'.
;;     Removed advised functions: dired-create(-files|directory),
;; 2007/09/01 dadams
;;     Advised dired-do-chmod.
;; 2006/02/02 dadams
;;     Bind both ) and ( to dired-details-toggle.
;; 2006/01/02 dadams
;;     Advised dired-byte-compile and dired-compress.
;; 2006/01/01 dadams
;;     Advised dired-create-directory.
;; 2005/12/30 dadams
;;     Advised dired-create-files.
;;     dired-details-(show|hide): Only fit frame if it's showing Dired.
;; 2005/12/26 dadams
;;     Updated groups.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; ;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;; Do this `defcustom' first, before we load `dired-details', so we
;;; don't pick up the `defcustom' there.  The default value here is
;;; the empty string, so the overlay doesn't give a false impression
;;; of the current column number.  This is important for frame fitting
;;; (see library `fit-frame.el', required by `autofit-frame.el').
;;;###autoload
(defcustom dired-details-hidden-string ""
  "*This string will be shown in place of file details and symbolic links."
  :group 'dired-details :group 'dired :type 'string)

(require 'dired-details) ;; dired-details-hide, dired-details-initially-hide,
                         ;; dired-details-install, dired-details-show,
                         ;; dired-details-state
(require 'autofit-frame nil t) ;; (no error if not found): fit-frame-if-one-window

;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Quiet the byte-compiler.
(defvar dired-details-state)
(defvar dired-details-initially-hide)

;;;;;;;;;;;;;;;;


;;;###autoload
(defcustom dired-details-propagate-flag t
  "*Non-nil means next Dired buffer should be displayed the same.
The last `dired-details-state' value set is used by the next Dired
buffer created."
  :group 'dired-details :group 'dired :type 'boolean)

(defvar dired-details-last-state nil
  "Last `dired-details-state' value.
This is changed each time any Dired buffer's state changes.")



;;; REPLACE ORIGINAL in `dired-details.el'.
;;; Temporarily widen.
;;; Delete overlays to trim new lines from, e.g. `C'.
;;; Use last hide/show state, if `dired-details-propagate-flag'.
;;;
(defun dired-details-activate ()
  "Set up dired-details in the current dired buffer.
Called by `dired-after-readin-hook' on initial display and when a
subdirectory is inserted (with `i').  The state is chosen as follows:
If the state is already established here, leave it alone.
If `dired-details-propagate-flag' is non-nil, then use the last state.
Otherwise, use the default state, as determined by
  `dired-details-initially-hide'."
  (save-excursion
    (save-restriction
      (widen)
      (dired-details-delete-overlays)
      (cond (dired-details-state        ; State chosen in this buffer; respect it.
             (when (eq 'hidden dired-details-state) (dired-details-hide)))
            ((and dired-details-propagate-flag ; Inherit state from previous.
                  dired-details-last-state)
             (when (eq 'hidden dired-details-last-state) (dired-details-hide)))
            (t
             ;;otherwise, use the default state
             (when dired-details-initially-hide (dired-details-hide)))))))

;; The test (get-buffer-window (current-buffer)) is to make sure that
;; Dired is already displayed.  If not, the selected frame is not what
;; we want to fit.
(eval-after-load "dired-details"
  '(progn
    (require 'dired)
    (dired-details-install)
    ;; Override bindings in `dired-details-install'.
    (define-key dired-mode-map "(" (if (fboundp 'dired-hide-details-mode)
                                       'dired-hide-details-mode ; Restore vanilla
                                     'dired-details-toggle))
    (define-key dired-mode-map ")" 'dired-details-toggle)
    (defadvice dired-details-show (after fit-dired-frame activate)
      "Save `dired-details-last-state'.  Fit Dired frame if `one-window-p'."
      (setq dired-details-last-state dired-details-state)
      (when (and (get-buffer-window (current-buffer))
                 (fboundp 'fit-frame-if-one-window))
        (fit-frame-if-one-window)))

    (defadvice dired-details-hide (after fit-dired-frame activate)
      "Save `dired-details-last-state'.  Fit Dired frame if `one-window-p'."
      (setq dired-details-last-state dired-details-state)
      (when (and (get-buffer-window (current-buffer))
                 (fboundp 'fit-frame-if-one-window))
        (fit-frame-if-one-window)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'dired-details+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; dired-details+.el ends here</pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a class="translation new" href="https://www.emacswiki.org/emacs?action=translate;id=dired-details+.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh" rel="nofollow">Add Translation</a></span><div class="edit bar"><a accesskey="c" class="comment local edit" href="https://www.emacswiki.org/emacs/Comments_on_dired-details%2b.el">Comments on dired-details+.el</a> <a class="password" href="https://www.emacswiki.org/emacs?action=password" rel="nofollow">This page is read-only</a> <a class="history" href="https://www.emacswiki.org/emacs?action=history;id=dired-details%2b.el" rel="nofollow">View other revisions</a> <a class="admin" href="https://www.emacswiki.org/emacs?action=admin;id=dired-details%2b.el" rel="nofollow">Administration</a></div><div class="time">Last edited 2018-01-01 18:53 UTC by <a class="author" href="https://www.emacswiki.org/emacs/DrewAdams" title="73.170.83.28">DrewAdams</a> <a class="diff" href="https://www.emacswiki.org/emacs?action=browse;diff=2;id=dired-details%2b.el" rel="nofollow">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="https://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="https://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="https://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="https://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="https://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="https://creativecommons.org/">CreativeCommons</a>
<a href="https://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
<p class="legal" style="padding-top: 0.5em">Please note our <a href="Privacy">Privacy Statement</a>.</p>
</div>
</body>
</html>
