const String separator = ',';

const String konstanzNodes = """name,floor,type,barrier-free,keywords,id,x,y 
Immobetriebe Empfang,0,hallway,TRUE,,0,5,15
Immobetriebe Büro,0,room,TRUE,,1,10,15
Farm Kueche,0,room,TRUE,0.01,2,15,15
Farm Buero Annabell Schaefer und Stephanie Hoffmann,0,room,TRUE,0.02,3,17,15
Farm Buero Nicola Voigt,0,room,TRUE,0.03,4,21,15
Farm Buero Christina Groll,0,room,TRUE,0.04,5,24,15
Monumentum,0,room,TRUE,0.05,6,27,15
Georgs Genuss Manufaktur,0,room,TRUE,0.06,7,32,15
Georgs Genuss Manufaktur,0,room,TRUE,0.07,8,38,15
Georgs Genuss Manufaktur,0,room,TRUE,0.08,9,42,15
jetzt-GmbH,0,room,TRUE,0.09,10,47,15
Eingangshalle,0,hallway,TRUE,,11,65,10
Chill Area,0,hallway,TRUE,,12,15,10
Gründungszimmer,0,room,TRUE,0.16,13,23,10
energy depot,0,room,TRUE,0.15,14,27,10
Laibmann,0,room,TRUE,0.14,15,32,10
farm,0,room,TRUE,0.10,16,55,15
Organi-Farms,0,room,TRUE,0.11,17,47,10
Organi-Farms,0,room,TRUE,0.12,18,42,10
Toilette Maenner Ost 1 ,0,toilet,FALSE,,19,55,13
Toilette Frauen Ost,0,toilet,TRUE,,20,53,13
Aufzug Ost ,0,elevator,TRUE,,21,51,5
farm,0,room,TRUE,0.13,22,37,10
Toilette Männer Ost 2 ,0,toilet,FALSE,,23,57,13
""";
const String konstanzEdges = """from,to,weight
0,1,2
0,3,6
2,9,3
4,3,5
3,4,2
1,2,3
3,2,1
0,2,1
3,4,1
3,2,6
4,5,10""";
