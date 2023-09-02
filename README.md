# LaTeX-Vorlage für VWAs

> [!NOTE]  
> Since this repository is specifically targeted at Austrian students,
> this documentation file will be available in German only. Also, this template
> project is likely useless outside of Austria.

## Was ist das?

Dieses Repository beinhaltet ein Vorlage-Projekt für eine VWA, die mit Hilfe
des Textsatzprogrammes [LaTeX](https://de.wikipedia.org/wiki/LaTeX) verfasst
werden soll. LaTeX bietet viele Vorteile, unter anderem die Automatisierung
vieler Arbeitsschritte, die in Microsoft Word oder OpenOffice, LibreOffice et al.
manuelle Intervention erfordern. Speziell seien an dieser Stelle das
automatisierte, stilgerechte Zitieren und die automatische Verzeichniserstellung
genannt.

Da LaTeX allerdings eine relativ steile Lernkurve hat, soll diese Vorlage
LaTeX-Einsteigern, die es einmal ausprobieren wollen, und die VWA als beste
Möglichkeit dafür sehen, einen einfachen Einstieg erleichtern.

## Warum?

Mir ist bewusst, dass LaTeX nichts für durchschnittliche Anwender\*innen ist,
ganz einfach, weil es eine relativ steile Lernkurve hat. Gleichzeitig bietet es
aber gerade im Bereich des wissenschaftlichen Arbeitens (wozu es 1980 von Leslie
Lamport und eigentlich TeX bereits 1977 von Donald E. Knuth konzipiert wurde)
wahnsinnig viele Vorteile, die vielen menschlichen Fehlerquellen vorbeugen
sollen.

So kann beispielsweise aus einer Bibliographiedatenbank (also einer
Literaturliste) automatisch nach einem definierten Stil zitiert werden, was die
Zitate konsistent macht. Aus dieser Bibliographiedatenbank kann automatisch ein
Literaturverzeichnis erstellt werden, in das nur diejenigen Einträge übernommen
werden, die tatsächlich zitiert wurden.

Des Weiteren wird automatisch ein Inhaltsverzeichnis erstellt, das immer die
aktuellsten Einträge enthält, etwas, das bspw. bei Textverarbeitungsprogrammen
wie MS Word, OpenOffice, LibreOffice, etc. nach jeder Kapiteländerung manuell
vorgenommen werden muss.

LaTeX kümmert sich selbst darum, den eingepflegten Inhalt möglichst leserlich
zu setzen (im Blocksatz werden bspw. keine großen Abstände eingefügt, wie Word
das sehr gerne macht) und versucht, nicht schlauer als die\*der Verfasser\*in des 
Dokuments zu sein (es verliert bspw. keine Stilvorlagen, sondern erzeugt immer
genau das, was man ihm anweist).

Gerade im naturwissenschaftlichen Bereich ist LaTeX zu empfehlen, weil sehr
viele Erweiterungspakete existieren, die das Arbeiten mit Formeln usw. erheblich
erleichtern, viele davon kommen bereits mit neuesten LaTeX-Installationen mit.

## Wie verwende ich das?

TL;DR: Wie jede andere LaTeX-Dokumentenklasse auch.

Eine ausführliche Anleitung und Dokumentation finden Sie im
[Wiki](https://github.com/a-leithner/latex-vwa-template/wiki) dieses
GitHub-Repositorys.

## Fehler, Fragen

Ich hoffe, dass diese Vorlage den an LaTeX interessierten Maturant\*innen
eine Hilfe ist. Sollten bei der Verwendung dieser Vorlage und der
Dokumentenklasse Fragen oder Probleme auftreten, können Sie oben über „Issues“ eine
Frage stellen oder ein Problem melden; ich bin sehr daran interessiert,
beim Einstieg in LaTeX bestmöglich zu helfen.

## Danksagungen, Verweise

Die hier angebotene Dokumentenklasse basiert auf der Dokumentenklasse `scrbook`
aus dem wunderbaren [KOMA-Script](https://www.komascript.de)-Projekt, dem ich
an dieser Stelle danken möchte.

Weiters existiert von Karl Voit von der TU Graz, ebenfalls [hier auf GitHub](https://github.com/novoid/LaTeX-KOMA-VWA),
eine ähnliche Vorlage, die mich erst auf die Idee brachte, diese Dokumentenklasse
anzufertigen.

## Copyright

Die Dokumentenklasse `vwa.cls`, die das Herzstück der Vorlage ausmacht, ist
lizenziert unter der LaTeX Project Public License, Version 1.3. Die entsprechenden
Regelungen, [hier](https://www.latex-project.org/lppl/) einsehbar, gelten und
in der Arbeit wird ein entsprechender Hinweis angedruckt, der zwar entfernt
werden kann, aber im Sinne der Fair-Use-Mentalität nicht entfernt werden sollte.

Die mitgelieferten Vorlagedateien, `kapitel/_abstract.tex`, `kapitel/_vorwort.tex`,
`kapitel/1_einleitung.tex`, `vwa.tex` und `vwa.bib` sind von der LPPL ausgenommen
und müssen daher in der Arbeit nicht erwähnt werden.

Dieses gesamte Repository unterliegt allerdings folgendem Copyright:  
Copyright &copy; 2020&ndash;2023 Alexander Leithner.
