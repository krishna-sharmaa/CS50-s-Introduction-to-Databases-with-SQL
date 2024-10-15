CREATE INDEX "courses_index" ON "courses"("title", "department", "number");

CREATE INDEX "courses_sem" ON "courses"("semester");

CREATE INDEX "enrollments_index" ON "enrollments"("course_id", "student_id")



