function L = dbv_huffmanCodeLength(img)

if ~isa(img,'uint8'),
	error('Argument muss vom Typ uint8 sein')
end

%relative Häufigkeiten der Farbwerte (=Symbole) bestimmen
f = imhist(img)';
f = f/numel(img);

symbols = find(f~=0);
f = f(symbols);

[f,sortindex] = sort(f);
symbols = symbols(sortindex);

len = length(symbols);
symbols_index = num2cell(1:len);
codeword_tmp = cell(len,1);
while length(f)>1,
	index1 = symbols_index{1};
	index2 = symbols_index{2};
	codeword_tmp(index1) = addnode(codeword_tmp(index1),uint8(0));
	codeword_tmp(index2) = addnode(codeword_tmp(index2),uint8(1));
	f = [sum(f(1:2)) f(3:end)];
	symbols_index = [{[index1 index2]} symbols_index(3:end)];
	% Häufigkeiten neu sortieren, damit die beiden kleinsten Elemente immer
	% am Anfang des Vektor stehen
	[f,sortindex] = sort(f);
	symbols_index = symbols_index(sortindex);
end

% cell array anlegen für Zuordnung Symbol -> Codewort
codeword = cell(256,1);
codeword(symbols) = codeword_tmp;

L = zeros(length(codeword), 1);
for index=1:length(codeword)
    L(index)=length(codeword{index});
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function codeword_new = addnode(codeword_old,item)
codeword_new = cell(size(codeword_old));
for index = 1:length(codeword_old),
	codeword_new{index} = [item codeword_old{index}];
end
