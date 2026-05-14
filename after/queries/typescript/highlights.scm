; extends

(type_alias_declaration
  name: (type_identifier) @type.annotation.definition)

(interface_declaration
  name: (type_identifier) @type.annotation.definition)

(type_parameter
  name: (type_identifier) @type.annotation.definition)

((type_identifier) @type.annotation
  (#has-ancestor? @type.annotation
    type_alias_declaration
    interface_declaration
    type_annotation
    type_predicate_annotation
    as_expression
    satisfies_expression
    extends_type_clause
    implements_clause
    type_arguments
    type_parameter
    constraint))

((predefined_type) @type.annotation.builtin
  (#has-ancestor? @type.annotation.builtin
    type_alias_declaration
    interface_declaration
    type_annotation
    type_predicate_annotation
    as_expression
    satisfies_expression
    type_arguments
    constraint))

(import_statement
  "type"
  (import_clause
    (named_imports
      (import_specifier
        name: (identifier) @type.annotation))))
