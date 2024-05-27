import random
import string

# Function to generate a random string for R_name and Description
def random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Number of records to insert
num_records = 500

# Generate SQL insert queries
queries = []
for i in range(1, num_records + 1):
    r_id = i
    r_name = random_string(10)  # Generate a random string of length 10 for R_name
    description = random_string(20)  # Generate a random string of length 20 for Description
    query = f"INSERT INTO Role_ (R_id, R_name, Description) VALUES ({r_id}, '{r_name}', '{description}');"
    queries.append(query)

# Write queries to a file
with open('insert_queries.sql', 'w') as f:
    for query in queries:
        f.write(query + '\n')

print("SQL insert queries have been generated and saved to insert_queries.sql.")
