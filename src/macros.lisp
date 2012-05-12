(in-package :optima)

(defmacro if-match (pattern arg &body (then &optional else))
  "Equivalent to (match ARG (PATTERN THEN) (otherwise ELSE))."
  `(match ,arg
     (,pattern ,then)
     (otherwise ,else)))

(defmacro if-smatch (pattern arg &body (then &optional else))
  "Equivalent to (smatch ARG (PATTERN THEN) (otherwise ELSE))."
  `(smatch ,arg
     (,pattern ,then)
     (otherwise ,else)))

(defmacro when-match (pattern arg &body body)
  "Equivalent to (match ARG (PATTERN BODY...))."
  `(match ,arg (,pattern ,@body)))

(defmacro when-smatch (pattern arg &body body)
  "Equivalent to (smatch ARG (PATTERN BODY...))."
  `(smatch ,arg (,pattern ,@body)))

(defmacro unless-match (pattern arg &body body)
  "Equivalent to (match ARG (PATTERN) (otherwise BODY...))."
  `(match ,arg
     (,pattern)
     (otherwise ,@body)))

(defmacro with-match (pattern arg &body body)
  "Equivalent to (ematch ARG (PATTERN BODY...))."
  `(ematch ,arg (,pattern ,@body)))

(defmacro lambda-match (&body clauses)
  "Equivalent to (lambda (arg) (match arg CLAUSES...))."
  (let ((arg (gensym)))
    `(lambda (,arg) (match ,arg ,@clauses))))

(defmacro lambda-ematch (&body clauses)
  "Equivalent to (lambda (arg) (ematch arg CLAUSES...))."
  (let ((arg (gensym)))
    `(lambda (,arg) (ematch ,arg ,@clauses))))

(defmacro lambda-cmatch (&body clauses)
  "Equivalent to (lambda (arg) (cmatch arg CLAUSES...))."
  (let ((arg (gensym)))
    `(lambda (,arg) (cmatch ,arg ,@clauses))))