fn add(a: i32, b: i32) -> i32 {
    a + b
}

fn main() {
    println!("hello, world");
    let a: i32 = 5;
    let b: i32 = 6;
    let c: i32 = add(a, b);
    println!("{} + {} = {}", a, b, c);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        assert_eq!(add(1, 2), 3);
    }
}
