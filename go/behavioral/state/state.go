package main

import "fmt"

type State interface {
	Next(tl *TrafficLight)
	Status() string
}

type TrafficLight struct{ state State }

func NewTrafficLight() *TrafficLight { return &TrafficLight{state: &RedState{}} }
func (tl *TrafficLight) Next()       { tl.state.Next(tl) }
func (tl *TrafficLight) Status()     { fmt.Printf("Light: %s\n", tl.state.Status()) }

type RedState struct{}

func (s *RedState) Next(tl *TrafficLight) { tl.state = &GreenState{} }
func (s *RedState) Status() string        { return "RED" }

type GreenState struct{}

func (s *GreenState) Next(tl *TrafficLight) { tl.state = &YellowState{} }
func (s *GreenState) Status() string        { return "GREEN" }

type YellowState struct{}

func (s *YellowState) Next(tl *TrafficLight) { tl.state = &RedState{} }
func (s *YellowState) Status() string        { return "YELLOW" }
