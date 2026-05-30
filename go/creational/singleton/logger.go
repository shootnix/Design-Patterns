package main

import (
	"fmt"
	"sync"
)

type Logger struct {
	entries []string
}

var (
	instance *Logger
	once     sync.Once
)

func GetLogger() *Logger {
	once.Do(func() {
		instance = &Logger{}
	})
	return instance
}

func (l *Logger) Log(message string) {
	l.entries = append(l.entries, message)
	fmt.Printf("[LOG] %s\n", message)
}

func (l *Logger) Entries() []string {
	return l.entries
}
