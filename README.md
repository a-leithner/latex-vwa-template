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

LaTeX kümmert sich selbst darum, den eingepflegten Inhalt möglichst leserlich
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
von „Medium“.

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
die Möglichkeit, das Repository [als ZIP-Archiv herunterzuladen](https://github.com/a-leithner/latex-vwa-template/archive/master.zip).
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

In den Zeilen 46 - 60 sind allgemeine Informationen auszufüllen, die sowohl auf
das Deckblatt der Arbeit kommen, als auch für die PDF-Datei von Bedeutung sind:

  - **Titel, Untertitel und Autor** werden mit den Befehlen `\title`,
    `\subtitle` und `\author` festgelegt, die entsprechenden Werte sind, wie
    bei LaTeX üblich, in die geschwungenen Klammern zu schreiben.
  - **BetreuerIn und Schule** werden darunter festgelegt: `\betreuer` ist für
    den Namen der *betreuenden Lehrkraft* vorgesehen, mittels `\betreuerLabel`
    kann ein eigenes „Label“, also eine eigene Beschriftung, für den Namen der
    Lehrkraft auf dem Deckblatt festgelegt werden. Es empfehlen sich „Betreuerin“
    und „Betreuer“ für deutschsprachige VWAs. Die *Schule* ist etwas komplexer
    festzulegen, da die Dokumentenklasse ein Schullogo (so wie von den meisten
    AHS vorgeschrieben) erwartet. Der Dateiname (relativ zur `vwa.tex`) kommt
    in die eckigen Klammern, in die ersten geschwungenen der Name der Schule und
    in die zweiten geschwungenen die Adresse. Für ein (fiktives) Wiener Gymnasium
    könnte das also so aussehen:
    ```tex
    \schule[figuren/bg25.png]{Bundesgymnasium Wien XXV}{Hans-Meyer-Platz 90 \\ 1250 Wien}
    ```
    Das bedeutet, dass das Schullogo im Ordner „figuren“ unter dem Namen „bg25.png“
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
    \date{Februar 2040}
    ```
    (Gesetzt den Fall, der Kandidat/die Kandidatin maturiert im Jahre 2040...)

Auf den folgenden Zeilen finden sich typographische Einstellungen, von denen
der Zeilenabstand nicht ohne Absprache mit dem Betreuer/der Betreuerin geändert
werden sollte: Der Befehl `\zeilenabstand{1.5}` (Z. 66) gibt an, dass die VWA, wie vom
Bildungsministerium vorgeschrieben, eineinhalbzeilig gesetzt werden soll. Das
ist sehr geschmacksabhängig, vielen Arbeiten tut solch großer Zeilenabstand
nicht gut, er kann daher bspw. mittels `\zeilenabstand{1}` auf einzeilig
reduziert werden. Mit Version 0.7 der Vorlage werden Fußnoten nun, egal wie
groß der Zeilenabstand für die restliche Arbeit auch sein mag, einzeilig gesetzt,
wie es die formalen Richtlinien des Ministeriums verlangen.

Wer möchte, kann sich seine Kopf- und Fußzeilen nach Maßgabe der Dokumentenklasse
selbst auswählen, auf den Zeilen 78 - 81 finden sich Befehle, die diese Einträge
steuern, es darf dabei manchmal aber nur einer ausgewählt werden:

  - `\keinTitelImKopf` entfernt den Titel aus den Kopfzeilen, wo er standardmäßig
    platziert wird.
  - `\titelImKopfKlein` verkleinert die Schriftgröße des Titels in den Kopfzeilen
    auf die kleinste, gerade noch lesbare. Diese Einstellung ist nicht zu
    empfehlen, lange Titel sollten eher in die Fußzeile. Dieser Befehl funktioniert
    *nicht*, wenn `\keinTitelImKopf` angegeben wurde.
  - `\titelImFuss` platziert den Titel im Format „Autor, Titel“ im linken
    Bereich der Fußzeile. Das ist besonders bei langen Titeln praktisch.
  - `\schuleImFuss` platziert den Namen des Autors/der Autorin im linken Bereich
	der Fußzeile und den Namen der Schule in den mittleren. Typographisch nur
	sinnvoll, wenn der Titel in der Kopfzeile steht. Funktioniert *nicht*, wenn
	`\titelImFuss` angegeben wurde.

Wer nichts außer den LaTeX-Standards aktuelles Kapitel und Seitenzahl in den
Kopf- und Fußzeilen stehen haben möchte, der aktiviert einfach `\keinTitelImKopf`,
die Fußzeile ist standardmäßig leer.

Auf Zeile 88 wird die erste Bibliographiedatenbank eingebunden, die auch mit
dieser Vorlage mitgeliefert wird, nämlich „vwa.bib“. Es kann sinnvoll sein,
wenn man sich mittels der Funktion „BibTeX exportieren“ Bibliographiecode aus
den Bibliothekssystemen des österreichischen Bibliothekenverbandes (also fast
alles Universitätsbibliotheken) herunterlädt, diese als eigenständige Dateien
neben dem Hauptdokument zu speichern und wie gezeigt, einzubinden. `biber` wird
sich dann um das Verarbeiten aller Dateien kümmern.

Auf Zeile 94 beginnt das eigentliche Dokument, von Zeile 103 - 109 befinden sich
vorgefertigte Anweisungen für ein Abstract und ein Vorwort, letzteres ist lt.
Ministerium optional, die Zeilen 107 - 109 können also im Ernstfall gelöscht
werden. Wie gezeigt befinden sich die Inhalte für das Abstract und das Vorwort
in den Dateien `kapitel/_abstract.tex` und `kapitel/_vorwort.tex`, wo sie
geändert werden können. Eigene Kapiteldateien, wie bspw. die Beispieldatei
`kapitel/1_einleitung.tex` sollten erst nach Zeile 115, wie in Zeile 117 gezeigt,
aber jedenfalls vor Zeile 121, eingebunden werden.

Hat man in seiner ganzen VWA keine Abbildungen und Tabellen, so sollte die Zeile
124 entweder durch Voranstellen eines Prozentzeichens kommentiert oder gelöscht
werden.

Den neuesten Handreichungen des Ministeriums ist zu entnehmen, dass eine wie
hier auf Zeile 129 erzeugte Selbstständigkeitserklärung optional ist, was
bedeutet, dass diese Zeile nach Absprache mit Direktion und Lehrkraft gelöscht
werden kann.

Genauso optional aber manchmal notwendig ist eine Gendererklärung, die von der
Vorlage seit Version 0.7 ebenfalls erzeugt werden kann. Generell ist es Usus,
eine solche Erklärung der Arbeit voranzustellen, meist noch vor dem Abstract.
In Zeile 101 ist gezeigt, wie man sie an ebendieser Stelle erzeugen kann.
*Wichtig* anzumerken ist es, dass eine solche Gendererklärung zwar vom Ministerium
empfohlen wird, aber ihre Inclusivität durch Verfasser*innen von VWA selbst
bewertet werden muss. Ich persönlich rate von ihrer Verwendung ab, weil sie die
Arbeit nicht wirklich inclusiver gestaltet, sondern immer noch einen fahlen
Beigeschmack hat. Wie gesagt, das ist Geschmackssache und sollte deshalb
*unbeding* mit der betreuenden Lehrkraft abgesprochen werden.

Der Wortlaut der Gendererklärung wurde aus diversen Diplomarbeiten übernommen;
er scheint eine Art Konsens der mehr oder weniger wissenschaftlichen Welt zu
sein - ich selbst bin für die Formulierung nicht verantwortlich und habe sie
auch nicht ersonnen. Wem eine andere Formulierung besser gefällt, kann sie in
Zeile 361 - 364 in der `vwa.cls` ändern.

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

```bibtex
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
das BibLaTeX-Kommando `\autocite`, das freilich auch verwendet werden kann.

**Hinweis zu den oben genannten Bibliothekssystemen:** Die Software des österr.
Bibliothekenverbandes erzeugt manchmal „komische“ BibTeX-Einträge, bspw. für
die Sprache (hier wird manchmal „ger“ angefügt, was im Literaturverzeichnis
nicht schön aussieht). Alle zu übernehmenden Einträge müssen deshalb geprüft
werden, außerdem ist gerade bei Einträgen vom Typ `@thesis` und `@phdthesis`
ein eigenes Feld, `type = {Masterarbeit}` bzw. `type = {Doktorarbeit}` anzuraten,
da BibLaTeX standardmäßig seltsame Label vergibt, so steht bspw. bei
`@phdthesis`-Einträgen lediglich „Diss.“ im Literaturverzeichnis.

**Hinweis zu mehreren konsekutiven Fußnoten:** Wer mehrere Fußnoten hintereinander
hat (was man, von einem typographischen Standpunkt aus gesehen, ohnedies unterlassen
sollte), kann sie mit einem kleinen Trick direkt von LaTeX mit einem Trennzeichen
trennen lassen, sodass es nicht aussieht, als hätte man eine einzige Fußnote mit
sehr großer Nummer. In Zeile 14 kann nach `parskip=half` noch die Option
`footnotes=multiple` (mit einem Komma getrennt) angehängt werden. Wenn man also
die Voreinstellungen übernommen hat und nur diese Option angehängt hat, sollte
die Zeile nun wie folgt aussehen:  
```tex
\documentclass[a4paper,12pt,oneside,BCOR=0mm,bibliography=totoc,parskip=half,footnotes=multiple]{vwa}
```
Das standardmäßige Trennzeichen ist dabei ein hochgestelltes Komma. In der
KOMA-Script-Dokumentation, auf S. 94 in der deutschsprachigen Fassung, ist
nachzulesen, wie man dieses Zeichen austauschen kann.

### Abbildungen

Abbildungen sind ein wenig kniffliger anzulegen, aber auch nicht schwierig.
Angenommen, ich möchte die Datei „funktion1.png“ als Abbildung mit der
Unterschrift „Lineare Funktion ersten Grades“ in meine Arbeit übernehmen, so
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
Unterschrift „Lineare Funktion ersten Grades (Abb.: Verf.)“, sodass auch die
Quelle angegeben ist, und einem LaTeX-internen „Label“ mit der Bezeichnung
`fig:funktion1`. Mittels `\ref{fig:funktion1}` kann dann später im Dokument
auf diese Abbildung verwiesen werden, sodass auch die richtige Abbildungszahl
automatisch übernommen wird.

*Anmerkung:* Zur Übersichtlichkeit empfiehlt es sich, auch die Abbildungen in
einem eigenen Ordner aufzubewahren.

**Neue, einfache Möglichkeit:** Weiters ist es möglich, über zwei von der
Dokumentenklasse zur Verfügung gestellte Kommandos die oben gezeigte Struktur
für Abbildungen ganz einfach mit einem Aufruf zu erzeugen.

Wer einfach ein Bild einbinden möchte, der verwendet, um dieselbe Datei wie
im obigen Beispiel in das Dokument zu übernehmen:
```tex
\abbildung{Lineare Funktion ersten Grades (Abb.: Verf.)}{funktion1.png}
```

Standardmäßig ist damit auf die Abbildung mithilfe von `\ref{abb:funktion1.png}`
zu verweisen, es wird im Label also immer der Dateiname mit vorangestelltem 
Präfix `abb:` verwendet.

Wem das aber nicht flexibel genug ist und stattdessen selbst auch noch die
Beschriftung im Abbildungsverzeichnis und das Label, mit dem man auf die Figur
verweisen kann, anpassen möchte, der verwendet folgendes Kommando:

```tex
\abbildung*{Lineare Funktion ersten Grades (Abb.: Verf., erstellt mittels GeoGebra)}{Lineare Funktion ersten Grades (Abb.: Verf.)}{abb:funktionLinearErsterGrad}{funktion1.png}
```

Somit wird im Abbildungsverzeichnis für diese Abbildung der Text „Lineare
Funktion ersten Grades (Abb.: Verf., erstellt mittels GeoGebra)“ angedruckt und
auf diese Abbildung lässt sich mit `\ref{abb:funktionLinearErsterGrad}`
verweisen. Wichtig ist, dass hier, um konsistent zu bleiben der Präfix `abb:`
mit eingegeben werden muss, sonst würde er schlichtweg fehlen (ist kein Fehler,
erschwert aber die Handhabung, wenn man beide Varianten mischt).

**Abbildungen im Text platzieren:** Wer Microsoft Word, LibreOffice o.ä.
gewohnt ist, dem wird es sicherlich spanisch vorkommen, dass LaTeX die
Abbildungen möglichst am Rande von Text platziert. Mit einiger Trickserei kann
man LaTeX dazu zwingen, die Abbildung direkt dort, wo sie definiert wurde, so
in den Text zu platzieren, dass der Text, der an der Stelle steht, die Graphik
umfließt. Das ist nun auch mit Version 0.5 dieser Vorlage möglich, allerdings
wird das [Paket `wrapfig`](https://ctan.org/pkg/wrapfig) benötigt.

Wie bereits oben gezeigt, können Abbildungen, die der Text umfließt, so erzeugt
werden:

```tex
\umflussabbildung{Lineare Funktion ersten Grades (Abb.: Verf.)}{funktion1.png}
```

Analog zu den anderen, standardisierten Abbildungskommandos gibt es auch hiervon
eine Version mit Sternchen, bei der man seine eigenen Beschreibungen für das
Abbildungsverzeichnis und Label erzeugen kann:

```tex
\umflussabbildung*{Lineare Funktion ersten Grades (Abb.: Verf., erstellt mittels GeoGebra)}{Lineare Funktion ersten Grades (Abb.: Verf.)}{abb:funktionLinearErsterGrad}{funktion1.png}
```

*Anmerkung:* Ist das Paket `wrapfig` nicht installiert und werden dennoch
Umflussabbildungen verwendet, bricht die Vorlage das Zusammenbauen der Arbeit
nicht ab: Es wird ein Fehler angezeigt und die Graphik stattdessen mit der der
verwendeten Variante von `\umflussabbildung` oder `\Umflussabbildung`
äquivalenten Version von `\abbildung` oder `\Abbildung` fortgefahren, Sie können
also dennoch auf die Abbildung mittels `\ref` verweisen.

**Skalierte Abbildungen:** Manchmal kommt es vor, dass man mit sehr großen
Abbildungen zu tun und kämpfen hat, weshalb es geschickt erscheint, die Graphiken
zu skalieren. Selbstverständlich geht das auch mit LaTeX und mit Version 0.5
dieser Vorlage auch sehr einfach mit den groß geschriebenen Varianten aller oben
gezeigten Kommandos. Dabei sind die Parameter für die Bildgröße, die an das
[Paket `graphicx`](https://ctan.org/pk/graphicx) weitergeleitet werden, *immer*
das letzte Argument:

```tex
\Abbildung{Lineare Funktion ersten Grades (Abb.: Verf.)}{funktion1.png}{height=2cm}
\Abbildung*{Lineare Funktion ersten Grades (Abb.: Verf., erstellt mittels GeoGebra)}{Lineare Funktion ersten Grades (Abb.: Verf.)}{abb:funktionLinearErsterGrad}{funktion1.png}{height=2cm}
```

Bei den Kommandos für Umflussabbildungen muss man allerdings ein bisschen
aufpassen: Die „normale“ Version definiert die Breite des Abbildungsbereiches
mit `0.5\textwidth`, also 50 % des Bereiches, der für Fließtext zur Verfügung
steht, und die Breite der Graphik mit `0.48\textwidth`, sodass links und rechts
der Graphik je 1 % des Textbereiches Abstand gehalten wird. Die skalierbare
Version der Umflussabbildungen *behält jedoch die Größe der Abbildung mit 50 %
bei!* Es ist daher unmöglich, die Graphik größer als 50 % des Textbereiches zu
skalieren und macht eigentlich wenig sinn, viel kleiner als 40 % zu gehen. Es
sollten bei skalierten Umflussabbildungen allerdings, sollte man sie tatsächlich
benötigen oder verwenden, *immer* dynamisch berechnete Größen verwendet werden,
also quasi `faktor mal \textwidth`, wie in den folgenden Beispielen gezeigt:

```tex
\Umflussabbildung{Lineare Funktion ersten Grades (Abb.: Verf.)}{funktion1.png}{width=0.3\textwidth}
\Umflussabbildung*{Lineare Funktion ersten Grades (Abb.: Verf., erstellt mittels GeoGebra)}{Lineare Funktion ersten Grades (Abb.: Verf.)}{abb:funktionLinearErsterGrad}{funktion1.png}{width=0.3\textwidth}
```

*Weitere Skalierungsmöglichkeiten* über die großgeschriebenen Varianten sind
alle, die das `graphicx` Paket unterstützt; überdies können auch alle anderen
optionalen Parameter des Kommandos `\includegraphics`, die in der
[Dokumentation von `graphicx`](http://mirror.kumi.systems/ctan/macros/latex/required/graphics/grfguide.pdf)
auf Seite 9 angegeben sind, verwendet werden.

### Anführungszeichen

Wer korrekte österreichische Anführungszeichen setzen will (empfiehlt sich),
der kann folgende Methoden verwenden:

  - entweder zwei Beistriche als öffnende und zwei Backticks (links neben der
    „Löschen“-Taste [Backspace] auf den meisten Tastaturen) als schließende
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
  - Wem das aber zu kompliziert ist, der nimmt einfach `"`, also die
    Gänsefüßchen, die mit Shift + 2 erzeugt werden, vorne und hinten:
    ```tex
    unter "Anführungszeichen"
    ```
    Einfache Anführungszeichen müssen allerdings so oder so wie unten beschrieben
    gesetzt werden:

Natürlich ist es mit den doppelten Anführungszeichen allerdings nicht getan.
Wer in Zitaten Zitate hat, wird um einfache Anführungszeichen nicht herumkommen.
Das geht wie folgt:

```tex
unter ,einfachen` Anführungszeichen
```

Hierbei ist das erste Anführungszeichen ein ganz normaler Beistrich.
    

### PDF erzeugen

Ist die Arbeit fertig abgefasst, oder möchte man sich den Zwischenstand ansehen,
so kann man eine PDF-Datei erzeugen. Das funktioniert entweder über einen
gesonderten LaTeX-Editor, wie „TeXWorks“, der mit TeX Live mitgeliefert wird,
oder über die Kommandozeile durch Ausführen der folgenden Abfolge von Befehlen:

```shell
pdflatex vwa.tex
biber vwa
pdflatex vwa.tex
pdflatex vwa.tex
```

Dann sollte man einen Haufen neuer Dateien, incl. einer „vwa.pdf“, in seinem
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
den gesamten Schriftbereich („Satzspiegel“) neu zu berechnen! Alle layouttechnischen
Änderungen, die man zum Abschluss der Arbeit vielleicht vornehmen möchte, sollten
erst **nach** Einstellen der Bindungskorrektur getroffen werden!

### Schriftgröße

Eine Schriftgröße von 12 Punkt ist typographischer Standard. Sofern möglich
sollte keine Schriftgröße unter 10 Punkt und keine Schriftgröße über 12 Punkt
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

### Anderssprachige Arbeiten

Bei vielen anderen Sprachen, man muss nur auf Englisch schauen, gelten freilich
andere Textsatzregeln, v.a. hinsichtlich Anführungszeichen und
selbstverständlich Silbentrennung. Wer seine Arbeit daher in einer anderen
Sprache als Deutsch verfasst, muss einige Anpassungen vornehmen:

  - *Silbentrennung:* In Z. 19 muss die entsprechende Sprache **als letzte** in
    der Liste in den eckigen Klammern angeführt werden, um sie als
    Standardsprache festzulegen. Wer nur, bspw., das Abstract, auf Englisch o.a.
    verfasst, muss diese Sprache **vor** `naustrian` eingeben. Für eine
    englischsprachige Arbeit sähe die Zeile 19 also wie folgt aus:
    ```tex
    \usepackage[naustrian,english]{babel}
    ```
    Bessere (und vor allem ausführlichere) Information, wie man mit
    mehrsprachigen LaTeX-Dokumenten umgeht, findet sich in der
    [Dokumentation](https://mirror.easyname.at/ctan/macros/latex/required/babel/base/babel.pdf)
    des [`babel` Paketes](https://www.ctan.org/pkg/babel).
  - *Anführungszeichen:* Es empfiehlt sich, statt der „magischen“
    Anführungszeichen (doppelte Verwendung von `"` erzeugt korrekte österr.
    Anführungszeichen) die für diejenige Sprache gedachten
    Mehrzeichen-Anführungszeichen zu verwenden, bspw. für englischsprachige
    Arbeiten:
    ```tex
    unter ``Anführungszeichen''
    ```
    Um die magischen Anführungszeichen abzuschalten, muss die Zeile 24 entw.
    gelöscht oder auskommentiert werden.  
    Die konkreten Einstellungen für das `csquotes` Paket (sofern man überhaupt
    `\enquote` verwendet oder die Arbeit gänzlich anderssprachig ist) verschiedene
    Sprachen finden sich in dessen [Dokumentation](https://mirror.easyname.at/ctan/macros/latex/contrib/csquotes/csquotes.pdf)
    auf Seite 17. Der enstpr. `style` Eintrag muss dann in Z. 23 gesetzt werden.
  - *Deckblatt:* Sofern das verlangt wird, und die Arbeit gänzlich in einer
    anderen Sprache als Deutsch verfasst wird, muss auch das Deckblatt geändert
    werden. Hierzu muss in der Datei `vwa.cls` in Zeile 144 der Textbaustein
    abgeändert werden.

## Fehler, Fragen

Ich hoffe, dass diese Vorlage den an LaTeX interessierten Maturanten und
Maturantinnen eine Hilfe ist. Sollten bei der Verwendung dieser Vorlage und der
Dokumentenklasse Fragen oder Probleme auftreten, kann oben über „Issues“ eine
Frage gestellt oder ein Problem gemeldet werden; ich bin sehr daran interessiert,
beim Einstieg in LaTeX bestmöglich zu helfen.

## Danksagungen, Verweise

Die hier angebotene Dokumentenklasse basiert auf der Dokumentenklasse `scrbook`
aus dem wunderbaren [KOMA-Script](https://www.komascript.de)-Projekt, dem ich
an dieser Stelle danken möchte.

Weiters existiert von Karl Voit von der TU Graz, ebenfalls [hier auf GitHub](https://github.com/novoid/LaTeX-KOMA-VWA),
eine ähnliche Vorlage, die mich erst auf die Idee brachte, diese Dokumentenklasse
anzufertigen. Da sie allerdings deutlich umfangreicher ist, habe ich mich
lediglich an ihr orientiert und keinen Code übernommen.

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
Copyright &copy; 2020 &mdash; 2021 Alexander Leithner.
