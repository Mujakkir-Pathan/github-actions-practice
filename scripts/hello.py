import requests
import numpy as np
import pandas as pd
import matplotlib
import openpyxl

def main():
    print("All dependencies imported successfully!")

    response = requests.get("https://api.github.com")

    if response.status_code == 200:
        print("GitHub API is reachable.")
    else:
        print(f"Request failed with status code: {response.status_code}")
        exit(1)

    data = np.array([10, 20, 30, 40, 50])
    df = pd.DataFrame({"Numbers": data})

    print("\nSample DataFrame:")
    print(df)

    print("\nMatplotlib Version:", matplotlib.__version__)
    print("OpenPyXL Version:", openpyxl.__version__)

if __name__ == "__main__":
    main()