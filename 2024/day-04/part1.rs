fn main() {
    let contents: String = std::fs::read_to_string("input.txt")
        .expect("Should have been able to read the file");

    let arr: Vec<&str> = contents.lines().collect();

    let mut amount_found: u32 = 0;

    for (line_idx, line) in arr.iter().enumerate() {
        //println!("Line {}: {}", line_idx, line);

        for (char_idx, ch) in line.chars().enumerate() {
            if ch == 'X' {
                let mut dirs: [bool; 8] = [false; 8];
                // Check if you can make XMAS anywhere starting from here

                for dir_idx in 0..8 {
                    let dir_x: i8 = match dir_idx {
                        0 | 1 | 7 => 1,
                        3 | 4 | 5 => -1,
                        2 | 6 | _ => 0,
                    };
                    let dir_y: i8 = match dir_idx {
                        5 | 6 | 7 => 1,
                        1 | 2 | 3 => -1,
                        0 | 4 | _ => 0,
                    };

                    let mut is_xmas = true;
                    for offset in 1..=3 {
                        // Calculate the next idx
                        let next_line_idx = line_idx as i64 + dir_y as i64 * offset as i64;
                        let next_char_idx = char_idx as i64 + dir_x as i64 * offset as i64;

                        // Ensure idx is within bounds
                        if next_line_idx < 0
                            || next_char_idx < 0
                            || next_line_idx as usize >= arr.len()
                            || next_char_idx as usize >= arr[next_line_idx as usize].chars().count()
                        {
                            is_xmas = false;
                            break;
                        }

                        // Check the char at the calculated position
                        if arr[next_line_idx as usize].chars().nth(next_char_idx as usize)
                            != Some(match offset {
                            1 => 'M',
                            2 => 'A',
                            3 => 'S',
                            _ => ' ',
                        })
                        {
                            is_xmas = false;
                            break;
                        }
                    }

                    if is_xmas {
                        dirs[dir_idx] = true;
                    }
                }

                for val in dirs {
                    if val {
                        amount_found += 1;
                    }
                }
            }
        }
    }

    println!("{}", amount_found);
}

