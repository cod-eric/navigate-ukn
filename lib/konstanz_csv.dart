const String separator = ',';

const String konstanzNodes = """name,floor,type,barrier-free,keywords,id,x,y 
0,Immobetriebe Empfang,0,hallway,TRUE,5,15,
1,Immobetriebe Büro,0,room,TRUE,10,15,
2,Farm Kueche,0,room,TRUE,15,15,0.01
3,Farm Buero Annabell Schaefer und Stephanie Hoffmann,0,room,TRUE,17,15,0.02
4,Farm Buero Nicola Voigt,0,room,TRUE,21,15,0.03
5,Farm Buero Christina Groll,0,room,TRUE,24,15,0.04
6,Monumentum,0,room,TRUE,27,15,0.05
7,Georgs Genuss Manufaktur,0,room,TRUE,32,15,0.06
8,Georgs Genuss Manufaktur,0,room,TRUE,38,15,0.07
9,Georgs Genuss Manufaktur,0,room,TRUE,42,15,0.08
10,jetzt-GmbH,0,room,TRUE,47,15,0.09
11,Eingangshalle,0,hallway,TRUE,65,10,
12,Chill Area,0,hallway,TRUE,15,10,
13,Gründungszimmer,0,room,TRUE,23,10,0.16
14,energy depot,0,room,TRUE,27,10,0.15
15,Laibmann,0,room,TRUE,32,10,0.14
16,farm,0,room,TRUE,55,15,0.10
17,Organi-Farms,0,room,TRUE,47,10,0.11
18,Organi-Farms,0,room,TRUE,42,10,0.12
19,Toilette Maenner Ost 1 ,0,toilet,FALSE,55,13,
20,Toilette Frauen Ost,0,toilet,TRUE,53,13,
21,Aufzug Ost ,0,elevator,TRUE,51,5,
22,farm,0,room,TRUE,37,10,0.13
23,Toilette Männer Ost 2 ,0,toilet,FALSE,57,13,
,,,,,,,
25,Aufzug West ,0,elevator,TRUE,8,5,
26,Putzen,0,cleaning,TRUE,52,3,
27,Treppe West ,0,stairs,FALSE,2,3,
28,Treppe Ost ,0,stairs,FALSE,58,3,
29,Toilette Männer West,0,toilet,FALSE,8,3,
30,Toilette Frauen West,0,toilet,FALSE,8,1,
31,,0,hallway,TRUE,5,0,
32,,0,hallway,TRUE,5,2,
33,,0,hallway,TRUE,5,5,
34,,0,hallway,TRUE,8,13,
35,,0,hallway,TRUE,11,13,
36,,0,hallway,TRUE,14,13,
37,,0,hallway,TRUE,17,13,
38,,0,hallway,TRUE,21,13,
39,,0,hallway,TRUE,24,13,
40,,0,hallway,TRUE,29,13,
41,,0,hallway,TRUE,33,13,
42,,0,hallway,TRUE,37,13,
43,,0,hallway,TRUE,41,13,
44,,0,hallway,TRUE,47,13,
45,,0,hallway,TRUE,52,13,
46,,0,hallway,TRUE,54,13,
47,,0,hallway,TRUE,57,12,
48,,0,hallway,TRUE,57,12,
49,,0,hallway,TRUE,57,10,
50,,0,hallway,TRUE,55,5,
""";
const String konstanzEdges = """
from,to,weight
0,34,1
1,35,1
2,36,1
3,37,1
4,38,1
5,39,1
6,40,1
7,41,1
8,42,1
9,43,1
10,44,1
11,47,1
12,37,1
13,39,1
14,40,1
15,41,1
16,45,1
17,44,1
18,43,1
19,47,1
20,46,1
21,49,1
22,42,1
23,47,1
25,33,1
26,50,1
27,32,1
28,50,1
29,32,1
30,31,1
31,32,1
32,33,1
33,34,1
34,35,1
35,36,1
36,37,1
37,38,1
38,39,1
39,40,1
40,41,1
41,42,1
42,43,1
43,44,1
44,45,1
45,46,1
46,47,1
47,48,1
48,49,1
49,50,1""";
