package main

type MilkDecorator struct{ beverage Beverage }

func WithMilk(b Beverage) Beverage  { return MilkDecorator{beverage: b} }
func (m MilkDecorator) Cost() int           { return m.beverage.Cost() + 30 }
func (m MilkDecorator) Description() string { return m.beverage.Description() + ", milk" }

type SugarDecorator struct{ beverage Beverage }

func WithSugar(b Beverage) Beverage { return SugarDecorator{beverage: b} }
func (s SugarDecorator) Cost() int           { return s.beverage.Cost() + 10 }
func (s SugarDecorator) Description() string { return s.beverage.Description() + ", sugar" }

type WhipDecorator struct{ beverage Beverage }

func WithWhip(b Beverage) Beverage  { return WhipDecorator{beverage: b} }
func (w WhipDecorator) Cost() int           { return w.beverage.Cost() + 50 }
func (w WhipDecorator) Description() string { return w.beverage.Description() + ", whip" }
