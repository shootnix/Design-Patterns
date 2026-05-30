package main

import "fmt"

type ReportGenerator interface {
	Header() string
	Body(rows []string) string
	Footer() string
}

// Generate is the template method.
func Generate(g ReportGenerator, rows []string) {
	fmt.Println(g.Header())
	fmt.Println(g.Body(rows))
	fmt.Println(g.Footer())
}

type CSVReport struct{}

func (CSVReport) Header() string { return "date,amount,status" }
func (CSVReport) Body(rows []string) string {
	out := ""
	for _, r := range rows {
		out += r + "\n"
	}
	return out
}
func (CSVReport) Footer() string { return fmt.Sprintf("# %d records", 0) }

type HTMLReport struct{}

func (HTMLReport) Header() string { return "<table><thead><tr><th>date</th><th>amount</th><th>status</th></tr></thead><tbody>" }
func (HTMLReport) Body(rows []string) string {
	out := ""
	for _, r := range rows {
		out += "  <tr><td>" + r + "</td></tr>\n"
	}
	return out
}
func (HTMLReport) Footer() string { return "</tbody></table>" }
