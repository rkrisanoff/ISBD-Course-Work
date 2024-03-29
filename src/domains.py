from enum import Enum
import random as rnd


Names = [
    'Harry',
    'Oliver',
    'Jack',
    'Charlie',
    'Thomas',
    'Jacob',
    'Alfie',
    'Riley',
    'William',
    'James',

    'Ada',
    'Beatrice',
    'Camilla',
    'Dorothy',
    'Elisa',
    'Frederica',
    'Helen',
    'Isabel',
    'Josephine',
    'Katherine'
]
Gender = ['male', 'female']

PositronicBrain = [
    "LYNN", "L2B8D","ZF0014","WMS12"
]
EyesSensors = [
    "VASYAN", "DIMON"
]

Body = [
    "ANTON", "TOLYAN", "ROMAN", "ARTYOM"
]

Descriptions = [
    'Ясность нашей позиции очевидна: новая модель организационной деятельности создаёт предпосылки для глубокомысленных рассуждений. Прежде всего, внедрение современных методик напрямую зависит от приоретизации разума над эмоциями. ',
    'Принимая во внимание показатели успешности, повышение уровня гражданского сознания не оставляет шанса для позиций, занимаемых участниками в отношении поставленных задач.',
    'Следует отметить, что семантический разбор внешних противодействий однозначно определяет каждого участника как способного принимать собственные решения касаемо направлений прогрессивного развития!',
    'Таким образом, новая модель организационной деятельности не оставляет шанса для кластеризации усилий.',
    'Прежде всего, выбранный нами инновационный путь представляет собой интересный эксперимент проверки приоретизации разума над эмоциями. '
]

TaskStates = [
    "in work",
    "need help",
    "waiting for resolution",
    "complete"
]

Asteroid = ["Ceres", "Pallas", "Juno", "Vesta",
            "Astraea", "Hebe", "Iris", "Flora", "Metis"]
Microreactor = ['MK1', 'MK2', 'MK3', 'MK4', 'MK5', 'MK6']
RoleNames = [
    "manager",
    "operator"
]
DateInstalling = ['2021-02-12', '2021-02-13', '2021-02-14', '2020-08-14', '2003-01-02',
                  '2005-05-27', '2006-02-10', '2002-12-22', '1990-04-28', '1981-12-19', '2015-12-16']


class Domain(Enum):
    def TASK_STATES(): return rnd.choice(TaskStates)
    def EYES_SENSORS(): return rnd.choice(EyesSensors)
    def BODY(): return rnd.choice(Body)
    def DESCRIPTIONS(): return rnd.choice(Descriptions)
    def GENDER(): return rnd.choice(Gender)
    def NAME(): return rnd.choice(Names)
    def AGE(): return rnd.randint(18, 60)
    def FLAG(): return rnd.random() >= 0.5
    def INDEX(): return rnd.randint(1, 1000)
    def NONEGATIVE_INTEGER(): return rnd.randint(0, 20000)
    def NATURAL(): return rnd.randint(1, 1000)
    def POSITRONIC_BRAIN(): return rnd.choice(PositronicBrain)
    def HIT_POINTS():return 100+rnd.randint(1, 1900)
    def DISTANCE():return rnd.randint(1, 50000)
    def ASTEROID(): return rnd.choice(Asteroid)
    def MICROREACTOR(): return rnd.choice(Microreactor)
    def ROLE_NAMES(): return rnd.choice(RoleNames)
    def BOOLEAN(): return rnd.random() >= 0.5
    def DATE_INSTALL(): return rnd.choice(DateInstalling)
