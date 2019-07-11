import os
import glob
import argparse

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--path', type=str)
    p.add_argument('--output', type=str)
    args = p.parse_args()
    files = glob.glob(os.path.join(args.path, '**/wiki_*'), recursive=True)
    out = open(args.output, "w", encoding="utf8")
    for file in files:
        with open(file, "r", encoding="utf8") as f:
            for line in f:
                out.write(line)
    out.close()

if __name__ == "__main__":
    main()