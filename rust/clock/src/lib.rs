#[allow(non_snake_case)]
pub mod Clock {
    use std::fmt::{self, Display};

    const DAY_MINS: i32 = 24 * 60;

    #[derive(PartialEq, Debug)]
    pub struct _Clock {
        mins: u16, // Between 0 and DAY_MINS
    }

    impl _Clock {
        pub fn new(hours: i32, minutes: i32) -> Self {
            let mins = hours * 60 + minutes;

            _Clock {
                mins: if mins >= 0 {
                    (mins % DAY_MINS) as u16
                } else {
                    mins.rem_euclid(DAY_MINS) as u16
                },
            }
        }

        pub fn add_minutes(&self, minutes: i32) -> Self {
            _Clock::new(0, (self.mins as i32) + minutes)
        }
    }

    impl Display for _Clock {
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            write!(f, "{:0>2}:{:0>2}", (self.mins / 60), self.mins % 60)
        }
    }

    pub fn new(hours: i32, minutes: i32) -> _Clock {
        _Clock::new(hours, minutes)
    }
}

