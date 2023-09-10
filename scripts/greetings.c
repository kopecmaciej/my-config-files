#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/utsname.h>
#include <time.h>

struct ColorInfo {
    const char* name;
    const char* code;
};

struct ColorInfo colorTable[] = {
    {"red", "\033[0;31m"},
    {"green", "\033[0;32m"},
    {"yellow", "\033[0;33m"},
    {"blue", "\033[0;34m"},
    {"purple", "\033[0;35m"},
    {"cyan", "\033[0;36m"},
    {"white", "\033[0;37m"},
};

const char* get_color_code(const char* color) {
    for (int i = 0; i < sizeof(colorTable) / sizeof(colorTable[0]); i++) {
        if (strcmp(color, colorTable[i].name) == 0) {
            return colorTable[i].code;
        }
    }
    return ""; 
}

void print_hostname(void)
{
  struct utsname unameData;
  if (uname(&unameData) == -1){
    perror("uname error");
    exit(1);
  }

  char *hostname = unameData.nodename;
  char *username = getenv("USER");
  printf("%s%s@%s\n", get_color_code("green"), username, hostname);
}

void print_uptime(void)
{
  FILE* uptimeFile = fopen("/proc/uptime", "r");
  if (!uptimeFile){
    perror("uptime error");
    exit(1);
  }

  double uptime;
  fscanf(uptimeFile, "%lf", &uptime);
  fclose(uptimeFile);

  int hours = (int)(uptime / 3600);
  int minutes = (int)((uptime - (hours * 3600)) / 60);
  
  if (minutes < 10){
    printf("%sUptime: %s%d:0%d\n", get_color_code("purple"), get_color_code("white"), hours, minutes);
  }
  else
  printf("%sUptime: %s%d:%d\n", get_color_code("purple"), get_color_code("white"), hours, minutes);
}

void print_ip(void)
{
  FILE* ipFile = popen("ip addr show", "r");
  if (!ipFile){
    perror("ip addr show error");
    exit(1);
  }

  char ip[100];
  char line[256];

  while (fgets(line, sizeof(line), ipFile)){
    if (strstr(line, "inet ") && !strstr(line, "127.0.0.1")){
      char* ipStart = strstr(line, "inet ") + 5;
      char* ipEnd = strstr(ipStart, "/") + 3;
      strncpy(ip, ipStart, ipEnd - ipStart);
      ip[ipEnd - ipStart] = '\0';
      break;
    }
  }

  printf("%sIP Address: %s%s\n", get_color_code("blue"), get_color_code("white"), ip);
}


void print_shell(void)
{
    char* shell = getenv("SHELL");
    char* version = NULL;

    if (strstr(shell, "bash")) {
        FILE* versionFile = popen("bash --version | head -n 1 | cut -d ' ' -f 4", "r");
        if (versionFile) {
            char buffer[256];
            if (fgets(buffer, sizeof(buffer), versionFile) != NULL) {
                version = strdup(buffer);
            }
            pclose(versionFile);
        }
    }
    else if (strstr(shell, "zsh")) {
        FILE* versionFile = popen("zsh --version", "r");
        if (versionFile) {
            char buffer[256];
            if (fgets(buffer, sizeof(buffer), versionFile) != NULL) {
                version = strdup(buffer);
            }
            pclose(versionFile);
        }
    }
    else if (strstr(shell, "fish")) {
      FILE* versionFile = popen("fish --version | cut -d ' ' -f 3", "r");
        if (versionFile) {
            char buffer[256];
            if (fgets(buffer, sizeof(buffer), versionFile) != NULL) {
                version = strdup(buffer);
            }
            pclose(versionFile);
        }
    }

    printf("%sShell: %s%s %s", get_color_code("red"), get_color_code("white"), shell, version ? version : "Unknown");
    free(version);
}


void print_battery_usage(void)
{
  FILE* batteryFile = fopen("/sys/class/power_supply/BAT0/capacity", "r");
  if (!batteryFile){
    perror("battery error");
    exit(1);
  }

  int battery;
  fscanf(batteryFile, "%d", &battery);
  fclose(batteryFile);

  if (battery < 50)
  printf("%sBattery: %s%d%%\n", get_color_code("yellow"), get_color_code("white"), battery);
}

void print_num_of_running_processes() {
    FILE* processFile = popen("ps -e | wc -l", "r");
    if (!processFile) {
        perror("process error");
        exit(1);
    }

    int num_of_processes;
    fscanf(processFile, "%d", &num_of_processes);
    pclose(processFile);

    printf("%sProcesses: %s%d\n", get_color_code("cyan"), get_color_code("white"), num_of_processes);
}

void print_current_time() {
    time_t rawtime;
    struct tm *info;
    time(&rawtime);
    info = localtime(&rawtime);
    printf("%s%s", get_color_code("cyan"), asctime(info));
}

int main(void)
{
  printf("\n");
  print_hostname();
  print_current_time();
  print_uptime();
  print_ip();
  print_shell();
  print_battery_usage();
  print_num_of_running_processes();
}
