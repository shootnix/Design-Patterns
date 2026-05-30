package main

func main() {
	rows := []string{"2024-01-01,100,paid", "2024-01-02,200,pending"}

	Generate(CSVReport{}, rows)
	Generate(HTMLReport{}, rows)
}
