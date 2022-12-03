package main

import (
	"bufio"
	"fmt"
	"os"
)

func part_1() {
	file, _ := os.Open("./input.txt")
	defer file.Close()
	f := bufio.NewScanner(file)
	score := 0
	for f.Scan() {
		line := []rune(string(f.Text()))
		value1 := line[0] - 64
		value2 := line[2] - 87
		if value2 == value1 {
			score += 3
		}
		if value2-value1 == 1 || value2-value1 == -2 {
			score += 6
		}

		score += int(value2)

		// fmt.Print(value1, value2)
	}

	fmt.Println("Part 1 ", score)
}

func part_2() {
	file, _ := os.Open("./input.txt")
	defer file.Close()
	f := bufio.NewScanner(file)
	score := 0
	for f.Scan() {
		line := []rune(string(f.Text()))
		value1 := line[0] - 64
		value2 := line[2] - 87
		if value2 == 2 {
			score += 3 + int(value1)
		}
		if value2 == 3 {
			score += 6
			score += int(value1)%3 + 1
		}
		if value2 == 1 {
			if value1 == 1 {
				score += 3
			}
			if value1 == 2 {
				score += 1
			}
			if value1 == 3 {
				score += 2
			}
		}

		// fmt.Print(value1, value2)
	}

	fmt.Print("Part 2 ", score)
}

func main() {
	part_1()

	part_2()
}
