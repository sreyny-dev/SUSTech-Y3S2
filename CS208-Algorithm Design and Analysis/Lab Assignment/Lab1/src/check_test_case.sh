javac GenerateTestData.java
javac YourQuickSort.java
javac StandardQuickSort.java
java GenerateTestData data.in
java YourQuickSort < data.in > output_custom.out
java StandardQuickSort < data.in > output_standard.out

if diff output_custom.out output_standard.out -b; then
    echo "Accepted"
else
    echo "Wrong Answer"
fi