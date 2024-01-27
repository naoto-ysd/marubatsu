package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

const (
	Empty   = " "
	PlayerX = "X"
	PlayerO = "O"
)

func main() {
	board := [][]string{
		{Empty, Empty, Empty},
		{Empty, Empty, Empty},
		{Empty, Empty, Empty},
	}

	currentPlayer := PlayerX
	for {
		printBoard(board)
		if hasWinner(board) {
			fmt.Printf("Player %s wins!\n", switchPlayer(currentPlayer))
			break
		}
		if isBoardFull(board) {
			fmt.Println("It's a draw!")
			break
		}

		row, col := getPlayerMove(board)
		board[row][col] = currentPlayer
		currentPlayer = switchPlayer(currentPlayer)
	}
}

func printBoard(board [][]string) {
	for i, row := range board {
		if i > 0 {
			fmt.Println("-----")
		}
		fmt.Println(strings.Join(row, "|"))
	}
	fmt.Println()
}

func getPlayerMove(board [][]string) (int, int) {
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Print("Enter row and column (e.g., 1 2): ")
		input, _ := reader.ReadString('\n')
		parts := strings.Fields(input)

		if len(parts) != 2 {
			fmt.Println("Invalid input. Please enter row and column.")
			continue
		}

		row, err1 := strconv.Atoi(parts[0])
		col, err2 := strconv.Atoi(parts[1])

		if err1 != nil || err2 != nil || row < 0 || col < 0 || row > 2 || col > 2 || board[row][col] != Empty {
			fmt.Println("Invalid move. Try again.")
			continue
		}

		return row, col
	}
}

func switchPlayer(player string) string {
	if player == PlayerX {
		return PlayerO
	}
	return PlayerX
}

func hasWinner(board [][]string) bool {
	for i := 0; i < 3; i++ {
		if board[i][0] != Empty && board[i][0] == board[i][1] && board[i][1] == board[i][2] {
			return true
		}
		if board[0][i] != Empty && board[0][i] == board[1][i] && board[1][i] == board[2][i] {
			return true
		}
	}

	if board[0][0] != Empty && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
		return true
	}
	if board[0][2] != Empty && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
		return true
	}

	return false
}

func isBoardFull(board [][]string) bool {
	for _, row := range board {
		for _, cell := range row {
			if cell == Empty {
				return false
			}
		}
	}
	return true
}
