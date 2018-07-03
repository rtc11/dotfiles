read inp
readarray a < inp
count=0
for row in "${a[@}"
do
  echo ++count " " row
done

