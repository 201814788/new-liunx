#current working
seq="/media/helen-hany/Biotechnology/bioinformatics/week one/task/seq.fasta"

#file here or not
echo "Looking for file at: $seq"
if [ ! -f "$seq" ]; then
echo "file not here"
exit 1
else 
  echo "file is here"
fi
#count bases in these files
echo -n "A: "; grep -v "^>" "$seq" | tr -d '\n' | grep -o "A" |wc -l
echo -n "T: "; grep -v "^>" "$seq" | tr -d '\n' | grep -o "A" |wc -l
echo -n "G: "; grep -v "^>" "$seq" | tr -d '\n' | grep -o "A" |wc -l
echo -n "C: "; grep -v "^>" "$seq" | tr -d '\n' | grep -o "A" |wc -l

# header
grep "^>" "$seq" > header.txt
head -n 5 "$seq"
 #extract first 10 base from seq1
 while read -r line; do
      echo "${line:0:10}"
      done < "$seq"
      
#calulate full length
length=$(grep -v "^>" "$seq" |tr -d '\n' | wc -c)
echo "total sequence length : $length bases"
 
 #reverse

rev_comp=$(echo "$seq" | tr 'ATGCatgc' 'TACGtacg' | rev)
echo "$rev_comp" > cpm2.txt
#search about specific codo
codo="ATG"
grep -q "$codo" "$seq" && echo "here" || echo "not here"
if echo "$seq" | grep -q "$codo"; then
echo "codon $codo is present"
else
echo "codon $codo not found"
fi

#calculate CG
seq1=$(grep -v "^>" "$seq" | tr -d '\n')
G=$(echo "$seq1" | grep -o "G" | wc -l)
C=$(echo "$seq1" | grep -o "C" | wc -l)
TOTAL=$(echo -n "$seq1" | wc -c)
GC=$((G + C))
GC_percent=$(echo "scale=2; $GC / $TOTAL * 100" | bc)
echo "GC Content of seq2: $GC_percent %"
