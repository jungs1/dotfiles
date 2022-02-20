import logging
import os
import difflib
import shutil

dir_path = os.path.dirname(os.path.realpath(__file__))
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

file_handler = logging.FileHandler(os.path.join(dir_path, 'events.log'))
file_handler.setLevel(logging.INFO)
file_handler.setFormatter(logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))
logger.addHandler(file_handler)

TORRENT_COMPLETED_DIR= "/media/nuclear/torrents/completed"
BASE_MEDIA_DIR = "/media/nuclear/media"
# SET YOUR OWN DIR 
ISO_DIR = ""
MEDIA_DIR = ""

def main():
    for root, dirs, files in os.walk(TORRENT_COMPLETED_DIR, topdown=True):
        for dir in dirs:
            dir_to_move = find_best_dir(dir, BASE_MEDIA_DIR)
            shutil.move(os.path.join(root, dir), dir_to_move)
            logger.info("FOLDER => Moved from {} to {}".format(dir, dir_to_move))
        for file in files:
            name, ext = os.path.splitext(file)
            # iso files
            if ext == '.iso':
                dir_to_move = find_best_dir(name, ISO_DIR)
                shutil.move(os.path.join(root, file), dir_to_move)
                logger.info("ISO => Moved from {} to {}".format(file, dir_to_move))
            # media files
            elif ext in ['.mkv', '.mp4']:
                dir_to_move = find_best_dir(MEDIA_DIR)
                shutil.move(os.path.join(root, file), dir_to_move)
                logger.info("MEDIA => Moved from {} to {}".format(file, dir_to_move))
        break

def find_best_dir(file, dir_to_look):
    max_ratio = 0
    dir_to_move = None
    for root, dirs, _ in os.walk(dir_to_look, topdown=False):
        for dir in dirs:
            ratio = difflib.SequenceMatcher(None, file, os.path.join(root, dir)).ratio()
            if ratio > max_ratio:
                max_ratio = ratio
                dir_to_move = os.path.join(root, dir)

    return dir_to_move

if __name__ == '__main__':
    main()