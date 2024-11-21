import os

# Define the directory where the log files are saved
log_dir = "./"
log_files = ["transcript", "vsim.wlf", "*.log"]  # You can add more log files as needed

# Function to check if a test passed
def check_test_result(log_file):
    try:
        with open(log_file, "r") as file:
            content = file.read()
            if "PASS" in content:
                return True
            elif "FAIL" in content or "ERROR" in content:
                return False
            else:
                return None
    except FileNotFoundError:
        print(f"Log file {log_file} not found.")
        return None

# Function to generate the summary
def generate_summary():
    summary = []
    summary.append("======================================================================")
    summary.append("Test Summary:")
    summary.append("======================================================================")

    # List of test cases to check
    test_cases = ["test", "test1", "test2", "test3", "test4", "test5"]

    for test in test_cases:
        log_file = f"{test}.log"  # Assuming each test generates a separate log file
        result = check_test_result(log_file)
        
        if result is None:
            summary.append(f"{test}: Log file not found or incomplete")
        elif result:
            summary.append(f"{test}: PASS")
        else:
            summary.append(f"{test}: FAIL")

    # Write the summary to a file
    with open("summary.txt", "w") as f:
        f.write("\n".join(summary))

# Run the summary generation
if __name__ == "__main__":
    generate_summary()
    print("Summary generated in 'summary.txt'")
