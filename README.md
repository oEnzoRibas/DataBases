# Databases

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-XX-blue?logo=postgresql) ![MySQL](https://img.shields.io/badge/MySQL-XX-orange?logo=mysql) ![SQLite](https://img.shields.io/badge/SQLite-XX-blue?logo=sqlite) ![Java](https://img.shields.io/badge/Java-XX-orange?logo=openjdk) ![License](https://img.shields.io/badge/License-MIT-green)


A personal repository for studying, implementing, experimenting with, and understanding **Database Systems**.

This repository contains coursework, exercises, SQL implementations, database projects, notes, and experiments developed throughout my studies.

The main goal is to understand databases not only from the perspective of writing SQL queries, but also from the perspective of **data modeling, relational theory, storage, indexing, transactions, concurrency, query processing, and database internals**.

---

## Complexity and Performance

Database performance is analyzed from more than just CPU complexity.

Whenever applicable, experiments consider:

```text
CPU cost
Memory usage
Disk I/O
Number of pages accessed
Number of records scanned
Index height
Selectivity
Cardinality
Transaction contention
```

For query experiments, execution plans and measurements are preferred over assumptions.

---

## Projects

Larger database experiments and applications are stored in `projects/`.

Possible projects include:

* [ ] Database-backed applications
* [ ] Query optimization experiments
* [ ] Index benchmarks
* [ ] Transaction/concurrency experiments
* [ ] Database schema design
* [ ] Mini relational database engine
* [ ] B+ Tree implementation
* [ ] Buffer manager
* [ ] Query execution engine

---

## Languages and Technologies

The repository may use different technologies depending on the experiment.

### Languages

* **SQL**
* **Java**
* **C++**
* **Python**

### Database Systems

* **PostgreSQL**
* **MySQL**
* **SQLite**

Additional DBMSs may be introduced as needed.

---

## Implementation Philosophy

The repository follows a simple principle:

> **Do not only learn how to use a database. Learn why it works.**

Whenever practical:

1. Understand the theoretical concept.
2. Implement a simplified version.
3. Test it with controlled inputs.
4. Measure its behavior.
5. Compare alternative approaches.
6. Connect the implementation to a real DBMS.

For example:

```text
B+ Tree
   ↓
Implement from scratch
   ↓
Benchmark
   ↓
Understand complexity
   ↓
Create index in PostgreSQL
   ↓
Use EXPLAIN ANALYZE
   ↓
Compare theory with practice
```

---

## Future Topics

This repository will evolve as my understanding of database systems develops.

Possible future areas include:

* [ ] Database internals
* [ ] Query execution engine
* [ ] B+ Tree implementation
* [ ] Buffer pool
* [ ] Transaction manager
* [ ] WAL and recovery
* [ ] MVCC
* [ ] Query optimizer
* [ ] Cost-based optimization
* [ ] Distributed databases
* [ ] Database replication
* [ ] Sharding
* [ ] Vector databases
* [ ] HTAP systems

---

## License

This project is licensed under the MIT License.

See [LICENSE](LICENSE) for details.
