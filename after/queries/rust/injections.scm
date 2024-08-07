;extends
((string_literal) @injection.content
    (#match? @injection.content "CREATE|SELECT|UPDATE|INSERT|DELETE|ALTER|DROP")
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql"))
