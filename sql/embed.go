package sql

import _ "embed"

//go:embed schema.sql
var DDL string

//go:embed seed.sql
var Seed string
