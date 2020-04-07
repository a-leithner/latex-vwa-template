# LaTeX-Vorlage für VWAs

*Note:* Since this repository is specifically targeted at Austrian students,
this documentation file will be available in German only. Also, this template
project is likely useless outside of Austria.

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

Mir ist bewusst, dass LaTeX nichts für den durchschnittlichen Anwender ist,
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

LaTeX kümmert sich selbst darum, den eingepflegten Inhalt, möglichst leserlich
zu setzen (im Blocksatz werden bspw. keine großen Abstände eingefügt, wie Word
das sehr gerne macht) und versucht, nicht schlauer als der Verfasser des 
Dokuments zu sein (es verliert bspw. keine Stilvorlagen, sondern erzeugt immer
genau das, was man ihm anweist).

Gerade im naturwissenschaftlichen Bereich ist LaTeX zu empfehlen, weil sehr
viele Erweiterungspakete existieren, die das Arbeiten mit Formeln usw. erheblich
erleichtern, viele davon kommen bereits mit neuesten LaTeX-Installationen mit.

## Wie verwende ich das?

Voraussetzung, um dieses Vorlagenprojekt und die mitgelieferte Dokumentenklasse
zu verwenden, ist eine funktionierende LaTeX-Installation, ich empfehle bspw.
[TeX Live](https://www.tug.org/texlive) in dem vorgegebenen Installationsumfang
von "Medium".

Jedenfalls ist zu kontrollieren, ob die Pakete `biblatex` und `biber` verfügbar
sind, denn diese kümmern sich um die Bibliographie. Bei TeX Live können beide
Pakete entweder von der Kommandozeile aus mittels

```shell
tlmgr install biblatex biber
```

oder über die graphischen Oberflächen, wie etwa `tlmgr gui` unter Linux und
macOS oder `tlshell` unter Windows, mit Hilfe der Paketnamen installiert werden.

Hat man sich vergewissert, dass alles auf LaTeX-Seite so weit funktioniert,
muss noch diese Vorlage heruntergeladen werden. Dazu gibt es hier auf GitHub
die Möglichkeit, das Repository [als ZIP-Archiv herunterzuladen](https://github.com/a-leithner/latex).
Ist dieses Archiv dann entpackt, kann losgelegt werden:

### Die Hauptdatei `vwa.tex`

Die Datei `vwa.tex` ist der Ort, an dem die Arbeit begonnen wird. Ich habe mich
für diese Vorlage für eine relativ komplexe Ordnerstruktur entschieden, um ein
bisschen besser Ordnung halten zu können. Daher wird jedes Kapitel in seiner
eigenen Datei verfasst, die im Ordner `kapitel/` abgelegt wird (freilich ist das
nur eine Empfehlung, aber die Arbeit an der Arbeit kann dadurch deutlich
übersichtlicher gestaltet werden).

Doch zunächst gilt es, die Metadaten auszufüllen; eigentlich ist in der Datei
bereits alles erklärt, der Vollständigkeit halber aber auch noch hier:

In den Zeilen 43 - 57 sind allgemeine Informationen auszufüllen, die sowohl auf
das Deckblatt der Arbeit kommen, als auch für die PDF-Datei von Bedeutung sind:

  - **Titel, Untertitel und Autor** werden mit den Befehlen `\title`,
    `\subtitle` und `\author` festgelegt, die entsprechenden Werte sind, wie
    bei LaTeX üblich, in die geschwungenen Klammern zu schreiben.
  - **BetreuerIn und Schule** werden darunter festgelegt: `\betreuer` ist für
    den Namen der *betreuenden Lehrkraft* vorgesehen, mittels `\betreuerLabel`
    kann ein eigenes "Label", also eine eigene Beschriftung, für den Namen der
    Lehrkraft auf dem Deckblatt festgelegt werden. Es empfehlen sich "Betreuer"
    und "Betreuer" für deutschsprachige VWAs. Die *Schule* ist etwas komplexer
    festzulegen, da die Dokumentenklasse ein Schullogo (so wie von den meisten
    AHS vorgeschrieben) erwartet. Der Dateiname (relativ zur `vwa.tex`) kommt
    in die eckigen Klammern, in die ersten geschwungenen der Name der Schule und
    in die zweiten geschwungenen die Adresse. Für ein (fiktives) Wiener Gymnasium
    könnte das also so aussehen:
    ```tex
    \schule[figuren/bg25.png]{Bundesgymnasium Wien XXV}{Hans-Meyer-Platz 90 \\ 1250 Wien}
    ```
    Das bedeutet, dass das Schullogo im Ordner "figuren" unter dem Namen "bg25.png"
    abgelegt ist (Achtung: auch unter Windows ist der Pfad-Trenner ein Schrägstrich!),
    die Schule das Bundesgymnasium Wien XXV ist und am Hans-Meyer-Platz 90 im 25.
    Bezirk steht. Optimalerweise hat das Logo eine Höhe von 30pt (also 30 Pixel),
    ansonsten wird es gleichmäßig auf 30pt Höhe skaliert (Seitenverhältnisse
    werden beibehalten).
  - **Ort und Abgabedatum** folgen auf dem Fuße: Die Stadt oder der Ort der
    Schule, der bereits in der Adresse vorkommt, wird mittels `\ort` eingestellt,
    das Monat und Jahr der Abgabe mittels `\date`. Für obiges Beispiel empfiehlt
    sich also
    ```tex
    \ort{Wien}
    \datum{Februar 2040}
    ```
    (Gesetzt den Fall, der Kandidat/die Kandidatin maturiert im Jahre 2040...)

Auf den folgenden Zeilen finden sich typographische Einstellungen, von denen
der Zeilenabstand nicht ohne Absprache mit dem Betreuer/der Betreuerin geändert
werden sollte: Der Befehl `\zeilenabstand{1.5}` (Z. 63) gibt an, dass die VWA, wie vom
Bildungsministerium vorgeschrieben, eineinhalbzeilig gesetzt werden soll. Das
ist sehr geschmacksabhängig, vielen Arbeiten tut solch großer Zeilenabstand
nicht gut, er kann daher bspw. mittels `\zeilenabstand{1}` auf einzeilig
reduziert werden.

Wer möchte, kann sich seine Kopf- und Fußzeilen nach Maßgabe der Dokumentenklasse
selbst auswählen, auf den Zeilen 75 - 78 finden sich Befehle, die diese Einträge
steuern, es darf dabei manchmal aber nur einer ausgewählt werden:

  - `\keinTitelImKopf` entfernt den Titel aus den Kopfzeilen, wo er standardmäßig
    platziert wird.
  - `\titelImKopfKlein` verkleinert die Schriftgröße des Titels in den Kopfzeilen
    auf die kleinste, gerade noch lesbare. Diese Einstellung ist nicht zu
    empfehlen, lange Titel sollten eher in die Fußzeile. Dieser Befehl funktioniert
    *nicht*, wenn `\keinTitelImKopf` angegeben wurde.
  - `\titelImFuss` platziert den Titel im Format "Autor, Titel" im linken
    Bereich der Fußzeile. Das ist besonders bei langen Titeln praktisch.
  - `\schuleImFuss` platziert den Namen des Autors/der Autorin im linken Bereich
	der Fußzeile und den Namen der Schule in den mittleren. Typographisch nur
	sinnvoll, wenn der Titel in der Kopfzeile steht. Funktioniert *nicht*, wenn
	`\titelImFuss` angegeben wurde.

Wer nichts außer den LaTeX-Standards aktuelles Kapitel und Seitenzahl in den
Kopf- und Fußzeilen stehen haben möchte, der aktiviert einfach `\keinTitelImKopf`,
die Fußzeile ist standardmäßig leer.

Auf Zeile 85 wird die erste Bibliographiedatenbank eingebunden, die auch mit
dieser Vorlage mitgeliefert wird, nämlich "vwa.bib". Es kann sinnvoll sein,
wenn man sich mittels der Funktion "BibTeX exportieren" Bibliographiecode aus
den Bibliothekssystemen des österreichischen Bibliothekenverbandes (also fast
alles Universitätsbibliotheken) herunterlädt, diese als eigenständige Dateien
neben dem Hauptdokument zu speichern und wie gezeigt, einzubinden. `biber` wird
sich dann um das Verarbeiten aller Dateien kümmern.

Auf Zeile 91 beginnt das eigentliche Dokument, von Zeile 95 - 101 befinden sich
vorgefertigte Anweisungen für ein Abstract und ein Vorwort, letzteres ist lt.
Ministerium optional, die Zeilen 99 - 101 können also im Ernstfall gelöscht
werden. Wie gezeigt befinden sich die Inhalte für das Abstract und das Vorwort
in den Dateien `kapitel/_abstract.tex` und `kapitel/_vorwort.tex`, wo sie
geändert werden können. Eigene Kapiteldateien, wie bspw. die Beispieldatei
`kapitel/1_einleitung.tex` sollten erst nach Zeile 107, wie in Zeile 109 gezeigt,
aber jedenfalls vor Zeile 113, eingebunden werden.

Hat man in seiner ganzen VWA keine Abbildungen und Tabellen, so sollte die Zeile
121 entweder durch Voranstellen eines Prozentzeichens kommentiert oder gelöscht
werden.

Den neuesten Handreichungen des Ministeriums ist zu entnehmen, dass eine wie
hier auf Zeile 124 erzeugte Selbstständigkeitserklärung optional ist, was
bedeutet, dass diese Zeile nach Absprache mit Direktion und Lehrkraft gelöscht
werden kann.

### Kapiteldateien

Für das eigene Verfassen von Kapiteln ist die Datei `kapitel/1_einleitung.tex`
als Vorlage gedacht, sie zeigt wie Überschriften auf unterschiedlichen Ebenen
erzeugt werden können. Weiter als `\subsection` sollte dabei allerdings nicht
gegangen werden, das Ministerium verbietet ausdrücklich jede Gliederungebene
länger als eine dreistellige, wie mittels `\subsection` erzeugt.

### Zitieren

In der Bibliographiedatenbank `vwa.bib` können Einträge für das Literaturverzeichnis
angelegt werden. Dabei wird jeder Eintrag mit einem eigenen Kürzel versehen,
wie in der Datei gezeigt. Konkret sieht ein Eintrag bspw. so aus:

```tex
@book{id,                               % Eintrag vom Typ "Buch" mit Identifikation "id"
    author = {Max Mustermann},          % Autor ist Max Mustermann
    title = {Die Mutter aller Bücher},  % Titel
    year = {2000},                      % erschienen im Jahr 2000
    publisher = {Dudenverlag}           % verlegt vom Dudenverlag
}
```

Wichtig ist, dass die Identifikation, die direkt hinter der öffnenden geschwungenen
Klammer steht, in der Bibliographiedatenbank einmalig ist und vor allem leicht
merkbar ist. Denn Einträge aus der Bibliographiedatenbank werden mittels dieses
Kürzels zitiert:

```tex
\zit{id}
```

Dieser Befehl erzeugt eine den ministerialen Vorgaben entsprechende Fußnote und
sorgt dafür, dass der jeweilige Eintrag in das Literaturverzeichnis aufgenommen
wird.

Will man der Fußnote etwas, bspw. Seitenzahlen, hintanstellen, so setzt man das
in eckige Klammern vor die geschwungenen:

```tex
\zit[S. 45]{id}   % Erzeugt "Mustermann, 2000, S. 45" als Fußnote
```

Möchte man der Fußnote etwas voranstellen, so setzt man das in eckige Klammern
vor die eckige Klammer der Schlussnotiz:

```tex
\zit[vgl.][S. 45]{id}   % Erzeugt "vgl. Mustermann, 2000, S.45" als Fußnote
```

Möchte man der Fußnote allerdings nur etwas voranstellen, so lässt man die
zweiten eckigen Klammern, die für die Schlussnotiz gedacht waren, leer:

```tex
\zit[vgl.][]{id}   % Erzeugt "vgl. Mustermann, 2000" als Fußnote
```

Das Kommando `\zit` ist ein von der Dokumentenklasse erzeugter Shortcut für
das BibLaTeX-Kommando `\autocite`, dass freilich auch verwendet werden kann.

**Hinweis zu den oben genannten Bibliothekssystemen:** Die Software des österr.
Bibliothekenverbandes erzeugt manchmal "komische" BibTeX-Einträge, bspw. für
die Sprache (hier wird manchmal "ger" angefügt, was im Literaturverzeichnis
nicht schön aussieht). Alle zu übernehmenden Einträge müssen deshalb geprüft
werden, außerdem ist gerade bei Einträgen vom Typ `@thesis` und `@phdthesis`
ein eigenes Feld, `type = {Masterarbeit}` bzw. `type = {Doktorarbeit}` anzuraten,
da BibLaTeX standardmäßig seltsame Label vergibt, so steht bspw. bei
`@phdthesis`-Einträgen lediglich "Diss." im Literaturverzeichnis.

### Abbildungen

Abbildungen sind ein wenig kniffliger anzulegen, aber auch nicht schwierig.
Angenommen, ich möchte die Datei "funktion1.png" als Abbildung mit der
Unterschrift "Lineare Funktion ersten Grades" in meine Arbeit übernehmen, so
schreibe ich:

```tex
\begin{figure}[h]
\centering
\includegraphics{funktion1.png}
\caption{Lineare Funktion ersten Grades (Abb.: Verf.)}
\label{fig:funktion1}
\end{figure}
```

Das erzeugt eine zentrierte Abbildung aus der Datei `funktion1.png` mit der
Unterschrift "Lineare Funktion ersten Grades (Abb.: Verf.)", sodass auch die
Quelle angegeben ist, und einem LaTeX-internen "Label" mit der Bezeichnung
`fig:funktion1`. Mittels `\ref{fig:funktion1}` kann dann später im Dokument
auf diese Abbildung verwiesen werden, sodass auch die richtige Abbildungszahl
automatisch übernommen wird.

*Anmerkung:* Zur Übersichtlichkeit empfiehlt es sich, auch die Abbildungen in
einem eigenen Ordner aufzubewahren.

### Anführungszeichen

Wer korrekte österreichische Anführungszeichen setzen will (empfiehlt sich),
der kann folgende Methoden verwenden:

  - entweder zwei Beistriche als öffnende und zwei Backticks (links neben der
    "Löschen"-Taste auf den meisten Tastaturen) als schließende
    Anführungszeichen:
    ```tex
    unter ,,Anführungszeichen``
    ```
  - oder das Kommando `\enquote`, wie folgt:
    ```tex
    unter \enquote{Anführungszeichen}
    ```
    Dies Kommando kommt aus dem Paket `csquotes`, das für das Literaturverzeichnis
    schon auf österreichische Anführungszeichen konfiguriert ist.
    

### PDF erzeugen

Ist die Arbeit fertig abgefasst, oder möchte man sich den Zwischenstand ansehen,
so kann man eine PDF-Datei erzeugen. Das funktioniert entweder über einen
gesonderten LaTeX-Editor, wie "TeXWorks", der mit TeX Live mitgeliefert wird,
oder über die Kommandozeile durch Ausführen der folgenden Abfolge von Befehlen:

```shell
pdflatex vwa.tex
biber vwa
pdflatex vwa.tex
pdflatex vwa.tex
```

Dann sollte man einen Haufen neuer Dateien, incl. einer "vwa.pdf", in seinem
Ordner liegen haben.

*Anmerkung:* Unter Windows ist freilich an die Programmnamen ein `.exe` anzuhängen!

## Fortgeschrittene Einstellungen

Es kann an der Datei `vwa.tex` noch einiges anderes geschraubt werden, was sich
evtl. als nützlich erweisen kann.

### Bindungsverfahren

Hat man sich für ein Bindungsverfahren entschieden, so ist beim Copyshop zu
erfragen, wieviel *Bindungskorrektur* miteinberechnet werden muss. Diese
Bindungskorrektur ist jener Teil, der links von den Seiten nach dem Binden nicht
mehr sichtbar ist. Kennt man diese Zahl nun, ändert man in der Zeile 14 den
Ausdruck `BCOR=0mm` auf den gewünschten Millimeterwert (mittels `BCOR=..mm`).

***Achtung:*** LaTeX, oder besser KOMA-Script, auf dem die Dokumentenklasse basiert,
wird dadurch gezwungen, nicht nur den Inhalt nach rechts zu verschieben, sondern
den gesamten Schriftbereich ("Satzspiegel") neu zu berechnen! Alle layouttechnischen
Änderungen, die man zum Abschluss der Arbeit vielleicht vornehmen möchte, sollten
erst **nach** Einstellen der Bindungskorrektur getroffen werden!

### Schriftgröße

Eine Schriftgröße von 12 Punkt ist typographischer Standard. Sofern möglich,
sollte keine Schriftgröße unter 10 Punkt, und keine Schriftgröße über 12 Punkt
gewählt werden. Sollte man sich mit 12 Punkt allerdings nicht anfreunden können,
so kann man in Zeile 14 den Ausdruck `12pt` durch die gewünschte Größe ersetzen.

### Absatzabstand

Der Abstand zwischen zwei Absätzen wird durch die Einstellung `parskip` in Z. 14
geregelt. Standardmäßig würde LaTeX gar keinen Abstand machen, sondern die erste
Zeile des neuen Absatzes einrücken. In Europa ist es allerdings Usus, einen
halbzeiligen Abstand einzuschieben. Aber auch das ist Geschmackssache, weshalb
statt `parskip=half` auch Werte wie `full` (für ganzzeiligen Abstand), `off`
(für Einzug statt Abstand) und `never` (nie, auch nicht, wenn explizit verlang,
einen Abstand zwischen zwei Absätzen erlauben) gewählt werden kann (wenngleich
unsinnig).

### Literaturverzeichnis aus dem Inhaltsverzeichnis entfernen

Das Bildungsministerium gibt vor, dass das Literaturverzeichnis (wie in
europäischen wissenschaftlichen Arbeiten üblich) im Inhaltsverzeichnis angegeben
werden muss. Will man das unter gar keinen Umständen, kann man den Eintrag
`bibliography=totoc` in Zeile 14 entfernen, oder, falls man ihn irrtümlich
entfernt hat, wieder anfügen (mit Komma getrennt!).

## Fehler, Fragen

Ich hoffe, dass diese Vorlage den an LaTeX interessierten Maturanten und
Maturantinnen eine Hilfe ist. Sollten bei der Verwendung dieser Vorlage und der
Dokumentenklasse Fragen oder Probleme auftreten, kann oben über "Issues" eine
Frage gestellt oder ein Problem gemeldet werden; ich bin sehr daran interessiert,
beim Einstieg in LaTeX bestmöglich zu helfen.

## Danksagungen, Verweise

Die hier angebotene Dokumentenklasse basiert auf der Dokumentenklasse `scrbook`
aus dem wunderbaren [KOMA-Script](https://www.komascript.de)-Projekt, dem ich
an dieser Stelle danken möchte.

Weiters existiert von Karl Voit von der TU Graz, ebenfalls [hier auf GitHub](https://github.com/novoid/LaTeX-KOMA-VWA)
eine ähnliche Vorlage, die mich erst auf die Idee brachte, diese Dokumentenklasse
anzufertigen. Da sie allerdings deutlich umfangreicher ist, habe ich mich
lediglich an ihr orientiert und keinen Code übernommen.

## Copyright

Die Dokumentenklasse `vwa.cls`, die das Herzstück der Vorlage ausmacht, ist
lizenziert unter der LaTeX Project Public License, Version 1.3. Die entsprechenden
Regelungen, [hier](https://www.latex-project.org/lppl/) einsehbar, gelten und
in der Arbeit wird ein entsprechender Hinweis angedruckt, der zwar entfernt
werden kann, aber im Sinne der Fair-Use-Mentalität nicht entwernt werden sollte.

Die mitgelieferten Vorlagedateien, `kapitel/_abstract.tex`, `kapitel/_vorwort.tex`,
`kapitel/1_einleitung.tex`, `vwa.tex` und `vwa.bib` sind von der LPPL ausgenommen
und müssen daher in der Arbeit nicht erwähnt werden.

Dieses gesamte Repository unterliegt allerdings folgendem Copyright:  
Copyright &copy; 2020 Alexander Leithner
