package top_pkg;

  typedef enum logic [3:0] {
    ST_IDLE    = 4'h1,
    ST_1       = 4'h2,
    ST_10      = 4'h4,
    ST_101     = 4'h8
  } fsm_state_t;

endpackage
